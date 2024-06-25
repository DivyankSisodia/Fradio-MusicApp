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
    apiKey: 'AIzaSyBkX7HSYE08EsvQMx6zGKa-ERcrPuUgs8M',
    appId: '1:771913849510:web:ccf78935cbb478f73ff267',
    messagingSenderId: '771913849510',
    projectId: 'fradio-c358e',
    authDomain: 'fradio-c358e.firebaseapp.com',
    storageBucket: 'fradio-c358e.appspot.com',
    measurementId: 'G-TJMNELF9D5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4cX9pAEg8kckbxGjSyO4iy7_YZ4hOeDA',
    appId: '1:771913849510:android:0e58e6848c7104033ff267',
    messagingSenderId: '771913849510',
    projectId: 'fradio-c358e',
    storageBucket: 'fradio-c358e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1EhssMSqUFlWMEfn6BJXOXhqXyI10LNE',
    appId: '1:771913849510:ios:3857507843456c0d3ff267',
    messagingSenderId: '771913849510',
    projectId: 'fradio-c358e',
    storageBucket: 'fradio-c358e.appspot.com',
    iosBundleId: 'com.example.fradio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1EhssMSqUFlWMEfn6BJXOXhqXyI10LNE',
    appId: '1:771913849510:ios:3857507843456c0d3ff267',
    messagingSenderId: '771913849510',
    projectId: 'fradio-c358e',
    storageBucket: 'fradio-c358e.appspot.com',
    iosBundleId: 'com.example.fradio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkX7HSYE08EsvQMx6zGKa-ERcrPuUgs8M',
    appId: '1:771913849510:web:194b759c52bea0d03ff267',
    messagingSenderId: '771913849510',
    projectId: 'fradio-c358e',
    authDomain: 'fradio-c358e.firebaseapp.com',
    storageBucket: 'fradio-c358e.appspot.com',
    measurementId: 'G-TV0NK0MP7Q',
  );
}
