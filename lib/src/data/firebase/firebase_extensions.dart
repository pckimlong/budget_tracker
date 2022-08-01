import 'package:budget_tracker/src/data/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

final _userDoc = kDebugMode
    ? "debug-user-id"
    : FirebaseAuth.instance.currentUser?.uid ?? "unauthorized";

const String _userPath = "users-data";
const String _categoryPath = "categories";

extension FireX on FirebaseFirestore {
  DocumentReference get userDoc => collection(_userPath).doc(_userDoc);

  CollectionReference<Category?> get categoryCollection =>
      userDoc.collection(_categoryPath).withConverter(
            fromFirestore: (d, _) => !d.exists ? null : Category.fromJson(d.toMap()),
            toFirestore: (data, _) => data?.toJson() as Map<String, Object?>,
          );
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
