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
    apiKey: 'AIzaSyDAVTtdsXh5spkzsiyLBzbBigZL9NrVpK0',
    appId: '1:622483960139:web:4b37c58d6abe07034038ce',
    messagingSenderId: '622483960139',
    projectId: 'appscom-c8369',
    authDomain: 'appscom-c8369.firebaseapp.com',
    storageBucket: 'appscom-c8369.firebasestorage.app',
    measurementId: 'G-JQMZWLR9YY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ0DZqzgRxkBDjwypLweG_PSMlaMSjdHs',
    appId: '1:622483960139:android:3d6108add0b4dacb4038ce',
    messagingSenderId: '622483960139',
    projectId: 'appscom-c8369',
    storageBucket: 'appscom-c8369.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcrBstrb4Ztg6a63SBeJGf-G0aXLr4beY',
    appId: '1:622483960139:ios:02e083cc9e7aee974038ce',
    messagingSenderId: '622483960139',
    projectId: 'appscom-c8369',
    storageBucket: 'appscom-c8369.firebasestorage.app',
    iosBundleId: 'com.example.appscom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcrBstrb4Ztg6a63SBeJGf-G0aXLr4beY',
    appId: '1:622483960139:ios:02e083cc9e7aee974038ce',
    messagingSenderId: '622483960139',
    projectId: 'appscom-c8369',
    storageBucket: 'appscom-c8369.firebasestorage.app',
    iosBundleId: 'com.example.appscom',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAVTtdsXh5spkzsiyLBzbBigZL9NrVpK0',
    appId: '1:622483960139:web:61369e53e29716504038ce',
    messagingSenderId: '622483960139',
    projectId: 'appscom-c8369',
    authDomain: 'appscom-c8369.firebaseapp.com',
    storageBucket: 'appscom-c8369.firebasestorage.app',
    measurementId: 'G-R4BJ5D3N5D',
  );
}