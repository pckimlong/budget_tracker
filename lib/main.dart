import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/src/app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

const String appVersion = "1.0.0";
bool isTesting = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  try {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    if (kIsWeb) await FirebaseFirestore.instance.enablePersistence();
  } catch (_) {}

  runApp(const ProviderScope(child: AppWidget()));
}
