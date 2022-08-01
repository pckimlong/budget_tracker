// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfHh5MOgqvm_fbY__4o6dC107SPJQAmf0',
    appId: '1:1013792169057:web:e3bc2df90605502a41de20',
    messagingSenderId: '1013792169057',
    projectId: 'simple-money-tra',
    authDomain: 'simple-money-tra.firebaseapp.com',
    storageBucket: 'simple-money-tra.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCeJmLg9NVR6UKe0ECRGhx1Gc5fsO-Fbs',
    appId: '1:1013792169057:ios:40b83d0e8ef3282641de20',
    messagingSenderId: '1013792169057',
    projectId: 'simple-money-tra',
    storageBucket: 'simple-money-tra.appspot.com',
    iosClientId: '1013792169057-kt51intc5rrcpu9mtv9o7tsmqcbt1ulp.apps.googleusercontent.com',
    iosBundleId: 'com.kimapp.budgetTracker',
  );
}
