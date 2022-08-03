import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/balance_adjustment_history.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _userPath = "users";
const String _categoryPath = "categories";
const String _tranPath = "transactions";
const String _adjustmentPaht = "balance-adjustments";

extension FireX on FirebaseFirestore {
  DocumentReference<Account?> userDoc(String? uuid) {
    return collection(_userPath).doc(uuid ?? "unauthorized").withConverter(
          fromFirestore: (d, _) {
            if (!d.exists || d.data() == null) null;
            return Account.fromJson(d.toMap());
          },
          toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
        );
  }

  CollectionReference<Category?> categoryCollection(String? uuid) =>
      userDoc(uuid).collection(_categoryPath).withConverter(
            fromFirestore: (d, _) => !d.exists ? null : Category.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );

  CollectionReference<Tran?> tranCollection(String? uuid) =>
      userDoc(uuid).collection(_tranPath).withConverter(
            fromFirestore: (d, _) => !d.exists ? null : Tran.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );

  CollectionReference<BalanceAdjustmentHistory?> balanceAdjustmentCollection(
          String? uuid) =>
      userDoc(uuid).collection(_adjustmentPaht).withConverter(
            fromFirestore: (d, _) =>
                !d.exists ? null : BalanceAdjustmentHistory.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
