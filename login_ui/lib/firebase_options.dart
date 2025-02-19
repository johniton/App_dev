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
        return macos;
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
    apiKey: 'AIzaSyDWz3_1lIzL1ts0hlcUc5CVsGBzpAhHd-w',
    appId: '1:779440527907:web:a9de092f577b1169366f96',
    messagingSenderId: '779440527907',
    projectId: 'auth1-1a298',
    authDomain: 'auth1-1a298.firebaseapp.com',
    storageBucket: 'auth1-1a298.firebasestorage.app',
    measurementId: 'G-BF2182LKCV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVOqhwKdWQdtJWhiybVZE64NARdsftyIo',
    appId: '1:779440527907:android:23287b54e2443702366f96',
    messagingSenderId: '779440527907',
    projectId: 'auth1-1a298',
    storageBucket: 'auth1-1a298.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANlpCfGpI9Wx7KeR9kP4gc_rqKl8v2Apg',
    appId: '1:779440527907:ios:3c98c68b3cae5a7f366f96',
    messagingSenderId: '779440527907',
    projectId: 'auth1-1a298',
    storageBucket: 'auth1-1a298.firebasestorage.app',
    iosBundleId: 'com.example.loginUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANlpCfGpI9Wx7KeR9kP4gc_rqKl8v2Apg',
    appId: '1:779440527907:ios:3c98c68b3cae5a7f366f96',
    messagingSenderId: '779440527907',
    projectId: 'auth1-1a298',
    storageBucket: 'auth1-1a298.firebasestorage.app',
    iosBundleId: 'com.example.loginUi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWz3_1lIzL1ts0hlcUc5CVsGBzpAhHd-w',
    appId: '1:779440527907:web:a9de092f577b1169366f96',
    messagingSenderId: '779440527907',
    projectId: 'auth1-1a298',
    authDomain: 'auth1-1a298.firebaseapp.com',
    storageBucket: 'auth1-1a298.firebasestorage.app',
    measurementId: 'G-BF2182LKCV',
  );

}