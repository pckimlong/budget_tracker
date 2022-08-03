import 'package:budget_tracker/src/data/firebase/firebase_datasource.dart';
import 'package:budget_tracker/src/providers/auth_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../exports.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final datasourceProvider = Provider<FirebaseDatasource>((ref) {
  final userId = ref.watch(AuthProviders.uuid);
  return FirebaseDatasource(
    firestore: ref.watch(firestoreProvider),
    userId: userId,
  );
});
