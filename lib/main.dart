
import 'dart:io';

import 'package:byteblocks/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyD5gcgBYQHctk7kX8TAdNDHAW7KxltjSjM",
  authDomain: "byteblocks-f98c1.firebaseapp.com",
  projectId: "byteblocks-f98c1",
  storageBucket: "byteblocks-f98c1.appspot.com",
  messagingSenderId: "88485706063",
  appId: "1:88485706063:web:3e33757bff13e350356d3a",
  measurementId: "G-SWQX9TNMSC"));
  }else{
 await Firebase.initializeApp();
  }
  HttpOverrides.global =  MyHttpOverrides();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(const ByteBlocks());
}
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


