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

/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // if (kIsWeb) {
    //   return web;
    // }
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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: "AIzaSyBltmu4cgYr9ZBQRu53R-tYl--FT0G-hH8",
  //   authDomain: "voteonissues-383b3.firebaseapp.com",
  //   projectId: "dropchatapp-8f951",
  //   storageBucket: "voteonissues-383b3.appspot.com",
  //   messagingSenderId: "47949668851",
  //   appId: "1:933285869257:web:93f4f69548810acb463f18",
  //   measurementId: "G-K03D8LSFP5",
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBltmu4cgYr9ZBQRu53R-tYl--FT0G-hH8',
    appId: '1:47949668851:android:f898c0b1ab973eb8fbb286',
    messagingSenderId: '47949668851',
    projectId: 'dropchatapp-8f951',
    storageBucket: 'dropchatapp-8f951.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBltmu4cgYr9ZBQRu53R-tYl--FT0G-hH8',
    appId: '1:933285869257:ios:bf7293b0fa81d9e3463f18',
    messagingSenderId: '47949668851',
    projectId: 'dropchatapp-8f951',
    storageBucket: 'dropchatapp-8f951.appspot.com',
    iosBundleId: 'com.example.voteOnIssues',
  );
}
