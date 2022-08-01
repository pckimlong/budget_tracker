// ignore_for_file: public_member_api_docs, sort_constructors_first
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
        if (event.exists || event.data() == null) {
          return right(Account());
        }

        final object = Account.fromJson(event.data() as Map<String, dynamic>);
        return right(object);
      },
    );
  }

  Future<TranId?> createTran(Tran data) async {
    return await firestore.runTransaction(
      (txn) async {
        return null;
      },
    );
  }
}
