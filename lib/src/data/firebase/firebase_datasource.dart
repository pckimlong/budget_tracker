// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_tracker/src/core/app_extensions.dart';
import 'package:budget_tracker/src/data/firebase/firebase_extensions.dart';
import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../exports.dart';
import '../../core/app_failure.dart';

class FirebaseDatasource {
  final FirebaseFirestore firestore;
  FirebaseDatasource({
    required this.firestore,
  });

  Stream<Either<Failure, IList<Category>>> streamAllCategory() {
    return firestore.categoryCollection
        .snapshots()
        .map((event) => right(event.docs.map((e) => e.data()!).toIList()));
  }

  Future<CategoryId?> createCategory(Category model) async {
    final ref = firestore.categoryCollection.doc();
    await firestore.categoryCollection.add(model.copyWith(id: ref.id));
    return ref.id;
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

        // working with account
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
            createdAt: DateTime.now(),
            modifiedAt: DateTime.now(),
          ),
        );

        return docRef.id;
      },
    );
  }

  void _incrementAccountBalance(Transaction txn, {required double increment}) {
    final docRef = firestore.userDoc;
    txn.update(
      docRef,
      {Account.totalBalanceKey: FieldValue.increment(increment)},
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
        txn.set(docRef, data.copyWith(modifiedAt: DateTime.now()));
      },
    );
  }
}
