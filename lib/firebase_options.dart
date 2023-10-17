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
    apiKey: 'AIzaSyCpmAYgkqkpKBmgcx1RWvnf_7aHazSEBIg',
    appId: '1:55075832278:web:d6037727944e4e62ada477',
    messagingSenderId: '55075832278',
    projectId: 'treinamento-olimpiadas',
    authDomain: 'treinamento-olimpiadas.firebaseapp.com',
    storageBucket: 'treinamento-olimpiadas.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZU6mJ3TPe2G2DhChnNRpvW9yhU7QTREQ',
    appId: '1:55075832278:android:ccf12e582cf5a96cada477',
    messagingSenderId: '55075832278',
    projectId: 'treinamento-olimpiadas',
    storageBucket: 'treinamento-olimpiadas.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZ39-piXHgl3RIAvDKZB9Q8GYckM_odT0',
    appId: '1:55075832278:ios:c1108be3e975ea26ada477',
    messagingSenderId: '55075832278',
    projectId: 'treinamento-olimpiadas',
    storageBucket: 'treinamento-olimpiadas.appspot.com',
    iosClientId: '55075832278-o816tja6qmr6eb8j6hd7qnb8htfnd9jn.apps.googleusercontent.com',
    iosBundleId: 'com.example.m7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZ39-piXHgl3RIAvDKZB9Q8GYckM_odT0',
    appId: '1:55075832278:ios:689772489ea95b9aada477',
    messagingSenderId: '55075832278',
    projectId: 'treinamento-olimpiadas',
    storageBucket: 'treinamento-olimpiadas.appspot.com',
    iosClientId: '55075832278-tl2ae8sejv8leobaiod1e687h9d94n87.apps.googleusercontent.com',
    iosBundleId: 'com.example.m7.RunnerTests',
  );
}
