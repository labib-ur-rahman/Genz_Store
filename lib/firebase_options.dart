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
    apiKey: 'AIzaSyDpF4doDikzGjMk_FhHdo9Y6YnO25HvoLo',
    appId: '1:804302570735:web:340d9a1dbedd408a0f871a',
    messagingSenderId: '804302570735',
    projectId: 'softylasa-genz-store',
    authDomain: 'softylasa-genz-store.firebaseapp.com',
    storageBucket: 'softylasa-genz-store.firebasestorage.app',
    measurementId: 'G-GKEZV58WQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBXF-rnZfmAfZSUPsvDcwADpdMH8ASLoM',
    appId: '1:804302570735:android:217beac878ca08d70f871a',
    messagingSenderId: '804302570735',
    projectId: 'softylasa-genz-store',
    storageBucket: 'softylasa-genz-store.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZptn7fUOj2h0nJD5di-jZ3GLhG1ooQNQ',
    appId: '1:804302570735:ios:be3e1b5a66bef2740f871a',
    messagingSenderId: '804302570735',
    projectId: 'softylasa-genz-store',
    storageBucket: 'softylasa-genz-store.firebasestorage.app',
    androidClientId: '804302570735-ffkp8f81gqlk3tmfphe5773tto9ffp0e.apps.googleusercontent.com',
    iosClientId: '804302570735-i4btidp5lv00pricqte27meb7tbhq1vf.apps.googleusercontent.com',
    iosBundleId: 'com.softylasa.genzStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZptn7fUOj2h0nJD5di-jZ3GLhG1ooQNQ',
    appId: '1:804302570735:ios:52623301cd9027a00f871a',
    messagingSenderId: '804302570735',
    projectId: 'softylasa-genz-store',
    storageBucket: 'softylasa-genz-store.firebasestorage.app',
    androidClientId: '804302570735-ffkp8f81gqlk3tmfphe5773tto9ffp0e.apps.googleusercontent.com',
    iosClientId: '804302570735-g0jga087s916mpmht47tkhiqrbor636p.apps.googleusercontent.com',
    iosBundleId: 'com.example.genzStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpF4doDikzGjMk_FhHdo9Y6YnO25HvoLo',
    appId: '1:804302570735:web:cf9a1d8deec464f90f871a',
    messagingSenderId: '804302570735',
    projectId: 'softylasa-genz-store',
    authDomain: 'softylasa-genz-store.firebaseapp.com',
    storageBucket: 'softylasa-genz-store.firebasestorage.app',
    measurementId: 'G-DKT4NW38GD',
  );

}