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
    apiKey: 'AIzaSyBPLOx8KyrI7O-gU6PboaeEyiMjlD85pt0',
    appId: '1:1098959632906:web:6687ad7d59c435fec0fdf3',
    messagingSenderId: '1098959632906',
    projectId: 'coffee-oasis-bee10',
    authDomain: 'coffee-oasis-bee10.firebaseapp.com',
    storageBucket: 'coffee-oasis-bee10.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmZ8S0tFWmppBl3bI89TDHc8kpZfAc8Kg',
    appId: '1:1098959632906:android:6b77eac22f8e99afc0fdf3',
    messagingSenderId: '1098959632906',
    projectId: 'coffee-oasis-bee10',
    storageBucket: 'coffee-oasis-bee10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlww_lwngNYs4TY79PGjeYQ_Kzt_VBmAk',
    appId: '1:1098959632906:ios:4f4948c2d33e31d8c0fdf3',
    messagingSenderId: '1098959632906',
    projectId: 'coffee-oasis-bee10',
    storageBucket: 'coffee-oasis-bee10.appspot.com',
    iosBundleId: 'com.example.coffeeOasis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlww_lwngNYs4TY79PGjeYQ_Kzt_VBmAk',
    appId: '1:1098959632906:ios:4f4948c2d33e31d8c0fdf3',
    messagingSenderId: '1098959632906',
    projectId: 'coffee-oasis-bee10',
    storageBucket: 'coffee-oasis-bee10.appspot.com',
    iosBundleId: 'com.example.coffeeOasis',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPLOx8KyrI7O-gU6PboaeEyiMjlD85pt0',
    appId: '1:1098959632906:web:5a18814f1b429893c0fdf3',
    messagingSenderId: '1098959632906',
    projectId: 'coffee-oasis-bee10',
    authDomain: 'coffee-oasis-bee10.firebaseapp.com',
    storageBucket: 'coffee-oasis-bee10.appspot.com',
  );
}
