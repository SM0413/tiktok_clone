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
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDzeMHWdfcZ77yVE4VEJU6JVsJjVHWNZYU',
    appId: '1:564608705418:web:8f2f0799a44a61b78d1e73',
    messagingSenderId: '564608705418',
    projectId: 'tiktok-ew-qwe',
    authDomain: 'tiktok-ew-qwe.firebaseapp.com',
    storageBucket: 'tiktok-ew-qwe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7XhxLrINqt4CZtaVsAN7NUaZ_tWFStQU',
    appId: '1:564608705418:android:c954c8cb7d654f1d8d1e73',
    messagingSenderId: '564608705418',
    projectId: 'tiktok-ew-qwe',
    storageBucket: 'tiktok-ew-qwe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJY_RvbiQzkTcwtV9HgVtyj3VDmvenkeM',
    appId: '1:564608705418:ios:05474be4b18622db8d1e73',
    messagingSenderId: '564608705418',
    projectId: 'tiktok-ew-qwe',
    storageBucket: 'tiktok-ew-qwe.appspot.com',
    iosClientId: '564608705418-tkj31jnr5vveo72jece9eqoaser8nqq1.apps.googleusercontent.com',
    iosBundleId: 'com.practice.tiktokclone',
  );
}