import 'dart:async';

import 'package:budget_tracker/exports.dart';
import 'package:budget_tracker/firebase_options.dart';
import 'package:budget_tracker/src/app_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

const String appVersion = "1.0.0";

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

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (kDebugMode) {
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      }
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    },
    FirebaseCrashlytics.instance.recordError,
  );
  runApp(const ProviderScope(child: AppWidget()));
}
