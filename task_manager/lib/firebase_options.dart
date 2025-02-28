// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCQmW67WDdtvV9X5yf5xU-ebWlsWQ4g5y4',
    appId: '1:228838878181:web:c8a5ed8072b613be4a5d0c',
    messagingSenderId: '228838878181',
    projectId: 'taskmanager-33900',
    authDomain: 'taskmanager-33900.firebaseapp.com',
    storageBucket: 'taskmanager-33900.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoatcTgm1MGyOCH5mSZIgIPRi7VX9wKfs',
    appId: '1:228838878181:android:6d227ed8e61065914a5d0c',
    messagingSenderId: '228838878181',
    projectId: 'taskmanager-33900',
    storageBucket: 'taskmanager-33900.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOpT0wrcnC5tyXaHxQf9E4EBzXEx-Ng1c',
    appId: '1:228838878181:ios:58b99667f57460c14a5d0c',
    messagingSenderId: '228838878181',
    projectId: 'taskmanager-33900',
    storageBucket: 'taskmanager-33900.firebasestorage.app',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQmW67WDdtvV9X5yf5xU-ebWlsWQ4g5y4',
    appId: '1:228838878181:web:8d1ceaabb04f38984a5d0c',
    messagingSenderId: '228838878181',
    projectId: 'taskmanager-33900',
    authDomain: 'taskmanager-33900.firebaseapp.com',
    storageBucket: 'taskmanager-33900.firebasestorage.app',
  );
}
