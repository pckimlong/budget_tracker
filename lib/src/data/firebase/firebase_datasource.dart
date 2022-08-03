// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/firebase/firebase_extensions.dart';
import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/balance_adjustment_history.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../exports.dart';
import '../../core/app_failure.dart';

class FirebaseDatasource {
  FirebaseDatasource({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  Future<Either<Failure, IList<Tran>>> findAllTranPagination(
    DateTime? createdAt,
    CategoryId? categoryId,
    int limit,
  ) async {
    var query = firestore.tranCollection
        .orderBy(Tran.createdAtKey, descending: true)
        .limit(limit);

    if (categoryId.isNotNullOrBlank) {
      query = query.where(Tran.categoryIdKey, isEqualTo: categoryId);
    }

    if (createdAt != null) {
      query = query.startAfter([createdAt.millisecondsSinceEpoch]);
    }
    final result = await query.get();
    return right(result.docs.map((e) => e.data()!).toIList());
  }

  Stream<Either<Failure, IList<Tran>>> streamAllTranByDate(DateTime date) {
    return firestore.tranCollection
        .where(Tran.dateKey, isEqualTo: date.dateOnly().millisecondsSinceEpoch)
        .orderBy(Tran.createdAtKey)
        .snapshots()
        .map((event) => right(event.docs.map((e) => e.data()!).toIList()));
  }

  Stream<Either<Failure, IList<Category>>> streamAllCategory() {
    return firestore.categoryCollection
        .orderBy(Category.nameKey)
        .snapshots()
        .map((event) => right(event.docs.map((e) => e.data()!).toIList()));
  }

  Stream<Either<Failure, IList<BalanceAdjustmentHistory>>> streamBalanceAdjustment() {
    return firestore.balanceAdjustmentCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((event) => right(event.docs.map((e) => e.data()!).toIList()));
  }

  Future<void> adjustBalance(double newBalance) async {
    await firestore.runTransaction((txn) async {
      final accRef = firestore.userDoc;
      final accDoc = await txn.get(accRef);
      if (accDoc.data() == null || !accDoc.exists) {
        txn.set(accRef, Account(totalBalance: newBalance));
      } else {
        txn.update(accRef, {Account.totalBalanceKey: newBalance});
      }
      final oldBalance = accDoc.data()?.totalBalance ?? 0;

      final adjustmentRef = firestore.balanceAdjustmentCollection.doc();
      txn.set(
        adjustmentRef,
        BalanceAdjustmentHistory(
          id: adjustmentRef.id,
          date: DateTime.now(),
          newBalance: newBalance,
          oldBalance: oldBalance,
        ),
      );
    });
  }

  Future<CategoryId?> createCategory(Category model) async {
    final ref = firestore.categoryCollection.doc();
    await ref.set(model.copyWith(
      id: ref.id,
      createdAt: DateTime.now(),
    ));
    return ref.id;
  }

  Future<IList<Tran>> fetchAllTranByDateRange(
      DateTime startDate, DateTime endDate) async {
    final start = startDate.dateOnly().millisecondsSinceEpoch;
    final end = endDate.dateOnly().millisecondsSinceEpoch;
    final result = await firestore.tranCollection
        .where(Tran.dateKey, isGreaterThanOrEqualTo: start)
        .where(Tran.dateKey, isLessThanOrEqualTo: end)
        .get();

    return result.docs.map((e) => e.data()!).toIList();
  }

  Future<void> updateCategory(Category model) async {
    final ref = firestore.categoryCollection.doc(model.id);
    ref.set(model.copyWith(createdAt: DateTime.now()));
  }

  Future<void> deleteCategory(CategoryId id) async {
    final ref = firestore.categoryCollection.doc(id);
    await ref.delete();
  }

  Stream<Either<Failure, Account>> watchAccount() {
    return firestore.userDoc.snapshots().map(
      (event) {
        if (event.data() == null) return right(Account());
        return right(event.data()!);
      },
    );
  }

  Future<TranId?> createTran(Tran data) async {
    return await firestore.runTransaction(
      (txn) async {
        // Validate amount
        final amount = data.amount;
        if (amount <= 0) {
          throw const Failure.invalidValue('Amount must greater than zero');
        }

        // Working with category
        final categoryRef = firestore.categoryCollection.doc(data.categoryId);
        final category = await txn.get(categoryRef);
        if (!category.exists || category.data() == null) {
          throw Failure.notFound('Invalid category id: ${data.categoryId}');
        }
        final type = category.data()!.type;
        final tranformedAmount = amount.transform(type);

        final accountRef = firestore.userDoc;
        final account = await txn.get(accountRef);

        if (account.exists) {
          _incrementAccountBalance(txn, increment: tranformedAmount);
        } else {
          txn.set(accountRef, Account(totalBalance: tranformedAmount));
        }

        final docRef = firestore.tranCollection.doc();
        txn.set(
          docRef,
          data.copyWith(
            id: docRef.id,
            date: data.date.dateOnly(),
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
          ),
        );

        return docRef.id;
      },
    );
  }

  Future<void> deleteTran(TranId id) async {
    await firestore.runTransaction(
      (txn) async {
        final dataRef = firestore.tranCollection.doc(id);
        final data = await txn.get(dataRef);
        if (!data.exists) throw Failure.notFound('Cannot find tran with id: $id');
        final tran = data.data()!;
        final cate = await txn.get(firestore.categoryCollection.doc(tran.categoryId));
        final type = cate.data()!.type;
        double amount;

        /// todo- what happend if we delete category?
        /// should do something to prevent deleting category
        switch (type) {
          case CategoryType.income:
            amount = tran.amount.toNegative();
            break;
          case CategoryType.expense:
            amount = tran.amount;
            break;
        }

        _incrementAccountBalance(txn, increment: amount);
        txn.delete(dataRef);
      },
    );
  }

  Future<Tran> findOneTran(String id) async {
    final result = await firestore.tranCollection.doc(id).get();
    if (!result.exists || result.data() == null) throw const Failure.notFound();
    return result.data()!;
  }

  Future<void> updateTran(Tran data) async {
    assert(data.id.isNotNullOrBlank);

    await firestore.runTransaction(
      (txn) async {
        // Validate amount
        final amount = data.amount;
        if (amount <= 0) {
          throw const Failure.invalidValue('Amount must greater than zero');
        }

        // Working with category
        final categoryRef = firestore.categoryCollection.doc(data.categoryId);
        final category = await txn.get(categoryRef);
        if (!category.exists || category.data() == null) {
          throw Failure.notFound('Invalid category id: ${data.categoryId}');
        }

        final docRef = firestore.tranCollection.doc(data.id);
        final oldData = await txn.get(docRef);
        if (oldData.data()?.categoryId != data.categoryId) {
          final oldRef = firestore.categoryCollection.doc(oldData.data()?.categoryId);
          final oldCate = await txn.get(oldRef);
          if (oldCate.data()?.type != category.data()?.type) {
            throw const Failure.invalidValue(
                'Cannot change category type from income to expense, or from expense to income. Preferred delete and recreate instead');
          }
        }

        final diffAmount = data.amount - oldData.data()!.amount;
        _incrementAccountBalance(txn, increment: diffAmount);
        txn.set(
          docRef,
          data.copyWith(
            date: data.date.dateOnly(),
            modifiedAt: DateTime.now(),
          ),
        );
      },
    );
  }

  void _incrementAccountBalance(Transaction txn, {required double increment}) {
    final docRef = firestore.userDoc;
    txn.update(
      docRef,
      {
        Account.totalBalanceKey: FieldValue.increment(increment),
      },
    );
  }
}
