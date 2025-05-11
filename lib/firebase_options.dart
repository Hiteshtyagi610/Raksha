
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyBK9p92W-RSDWNQoSidOmkO23lL52Ww29c',
    appId: '1:253979077325:web:d9f8776e5393a6e8369784',
    messagingSenderId: '253979077325',
    projectId: 'vihaan-project-5762b',
    authDomain: 'vihaan-project-5762b.firebaseapp.com',
    storageBucket: 'vihaan-project-5762b.firebasestorage.app',
    measurementId: 'G-LE0H9X9LZ6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAkgCSaI4Iyk18Nw-KiwD1R2GN-yQQ8lA',
    appId: '1:253979077325:android:c70a74294051c1ba369784',
    messagingSenderId: '253979077325',
    projectId: 'vihaan-project-5762b',
    storageBucket: 'vihaan-project-5762b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOqw1XCMhbGknxKWmh1ptJa2iRIXD0DwQ',
    appId: '1:253979077325:ios:b1a8d00834ce993d369784',
    messagingSenderId: '253979077325',
    projectId: 'vihaan-project-5762b',
    storageBucket: 'vihaan-project-5762b.firebasestorage.app',
    iosBundleId: 'com.example.vihaanProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOqw1XCMhbGknxKWmh1ptJa2iRIXD0DwQ',
    appId: '1:253979077325:ios:b1a8d00834ce993d369784',
    messagingSenderId: '253979077325',
    projectId: 'vihaan-project-5762b',
    storageBucket: 'vihaan-project-5762b.firebasestorage.app',
    iosBundleId: 'com.example.vihaanProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBK9p92W-RSDWNQoSidOmkO23lL52Ww29c',
    appId: '1:253979077325:web:563b8ad0da86f1ad369784',
    messagingSenderId: '253979077325',
    projectId: 'vihaan-project-5762b',
    authDomain: 'vihaan-project-5762b.firebaseapp.com',
    storageBucket: 'vihaan-project-5762b.firebasestorage.app',
    measurementId: 'G-LLZ0WM3NP3',
  );
}
