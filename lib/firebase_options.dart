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
    apiKey: 'AIzaSyCAywokAbZs6dxyCD6xpphou3rrmWcwZ1c',
    appId: '1:1054297468071:web:7acb7e41be843a3dfc7f82',
    messagingSenderId: '1054297468071',
    projectId: 'fir-series-19130',
    authDomain: 'fir-series-19130.firebaseapp.com',
    storageBucket: 'fir-series-19130.appspot.com',
    measurementId: 'G-SY01EXLMWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqLdeA0WRprp6AuHU2-8S3f5jQm676D6k',
    appId: '1:1054297468071:android:26c059e9091c29d6fc7f82',
    messagingSenderId: '1054297468071',
    projectId: 'fir-series-19130',
    storageBucket: 'fir-series-19130.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCc5ovlwg20SJroXWm34CYEQqCwsZ-3As',
    appId: '1:1054297468071:ios:35ff4c0b5d344faffc7f82',
    messagingSenderId: '1054297468071',
    projectId: 'fir-series-19130',
    storageBucket: 'fir-series-19130.appspot.com',
    iosBundleId: 'com.example.firebaseSeries',
  );
}
