import 'package:budget_tracker/src/data/model/account.dart';
import 'package:budget_tracker/src/data/model/balance_adjustment_history.dart';
import 'package:budget_tracker/src/data/model/category.dart';
import 'package:budget_tracker/src/data/model/tran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

const String _userPath = "users-data";
const String _categoryPath = "categories";
const String _tranPath = "transactions";
const String _adjustmentPaht = "balance-adjustments";

extension FireX on FirebaseFirestore {
  String get _userDoc => kDebugMode
      ? "debug-user-id"
      : FirebaseAuth.instance.currentUser?.uid ?? "unauthorized";

  DocumentReference<Account?> get userDoc =>
      collection(_userPath).doc(_userDoc).withConverter(
            fromFirestore: (d, _) {
              if (!d.exists || d.data() == null) null;
              return Account.fromJson(d.toMap());
            },
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );

  CollectionReference<Category?> get categoryCollection =>
      userDoc.collection(_categoryPath).withConverter(
            fromFirestore: (d, _) => !d.exists ? null : Category.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );
  CollectionReference<Tran?> get tranCollection =>
      userDoc.collection(_tranPath).withConverter(
            fromFirestore: (d, _) => !d.exists ? null : Tran.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );
  CollectionReference<BalanceAdjustmentHistory?> get balanceAdjustmentCollection =>
      userDoc.collection(_adjustmentPaht).withConverter(
            fromFirestore: (d, _) =>
                !d.exists ? null : BalanceAdjustmentHistory.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
