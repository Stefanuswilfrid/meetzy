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
    apiKey: 'AIzaSyAO6-bYIdo_NjkkEbLVu6XtU0IFiEZrxfk',
    appId: '1:339699025917:web:a6f979f520f69b12cb7b94',
    messagingSenderId: '339699025917',
    projectId: 'social-experiment-90137',
    authDomain: 'social-experiment-90137.firebaseapp.com',
    databaseURL: 'https://social-experiment-90137-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'social-experiment-90137.appspot.com',
    measurementId: 'G-5WZH0F9DYG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACX8dHdxk7feqtJZfbv24jNoWBfP1nErs',
    appId: '1:339699025917:android:675756cdc9f812c0cb7b94',
    messagingSenderId: '339699025917',
    projectId: 'social-experiment-90137',
    databaseURL: 'https://social-experiment-90137-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'social-experiment-90137.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIiZVSgcju5Azr9UqK2T_Pi5OSqQN3Ibw',
    appId: '1:339699025917:ios:614f9e0bf437f19acb7b94',
    messagingSenderId: '339699025917',
    projectId: 'social-experiment-90137',
    databaseURL: 'https://social-experiment-90137-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'social-experiment-90137.appspot.com',
    iosClientId: '339699025917-vvd0ir8qmdi6e88qr0rm4mu63jbf3gds.apps.googleusercontent.com',
    iosBundleId: 'com.example.meetzy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIiZVSgcju5Azr9UqK2T_Pi5OSqQN3Ibw',
    appId: '1:339699025917:ios:aaccf28e6da8ac63cb7b94',
    messagingSenderId: '339699025917',
    projectId: 'social-experiment-90137',
    databaseURL: 'https://social-experiment-90137-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'social-experiment-90137.appspot.com',
    iosClientId: '339699025917-3p5v0bsik0jvisujs4ft48lb9gu9lool.apps.googleusercontent.com',
    iosBundleId: 'com.example.meetzy.RunnerTests',
  );
}
