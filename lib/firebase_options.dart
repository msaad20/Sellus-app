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
    apiKey: 'AIzaSyAPG7B5DJPDCp9Zefs366MBd-Nbw_5m62A',
    appId: '1:1021629876426:web:ca0f601e9fea1abba24c33',
    messagingSenderId: '1021629876426',
    projectId: 'sellusapp',
    authDomain: 'sellusapp.firebaseapp.com',
    storageBucket: 'sellusapp.appspot.com',
    measurementId: 'G-HS4R95BFZ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvRH7eBeg6g6z5774Yvse7yNCW7LrqX8A',
    appId: '1:1021629876426:android:7863b8d02d14c34da24c33',
    messagingSenderId: '1021629876426',
    projectId: 'sellusapp',
    storageBucket: 'sellusapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxSVszch3jj7gmC7yRl6AniMVcRnvOOeE',
    appId: '1:1021629876426:ios:d2473cad1e1cec78a24c33',
    messagingSenderId: '1021629876426',
    projectId: 'sellusapp',
    storageBucket: 'sellusapp.appspot.com',
    androidClientId: '1021629876426-j1uitdf2c5b8s0r4r7h4kqjm78604gh8.apps.googleusercontent.com',
    iosClientId: '1021629876426-0llo3kn6gurfffjkj172d3v9l54ljj00.apps.googleusercontent.com',
    iosBundleId: 'com.example.sellusapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxSVszch3jj7gmC7yRl6AniMVcRnvOOeE',
    appId: '1:1021629876426:ios:a0d4f18ed2f80c38a24c33',
    messagingSenderId: '1021629876426',
    projectId: 'sellusapp',
    storageBucket: 'sellusapp.appspot.com',
    androidClientId: '1021629876426-j1uitdf2c5b8s0r4r7h4kqjm78604gh8.apps.googleusercontent.com',
    iosClientId: '1021629876426-b9rjdie58a7gu7vfbam5818k2hg2uqln.apps.googleusercontent.com',
    iosBundleId: 'com.example.sellusapp.RunnerTests',
  );
}
