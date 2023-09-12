import 'package:flutter/material.dart'; 

import 'package:firebase_core/firebase_core.dart'; 

import 'firebase_options.dart'; 

import 'quan_li_tai_san.dart'; 

 

void main() async { 

  WidgetsFlutterBinding.ensureInitialized(); 

  await Firebase.initializeApp( 

    options: DefaultFirebaseOptions.currentPlatform, 

  ); 

  runApp(const MyApp()); 

} 

 

class MyApp extends StatelessWidget { 

  const MyApp({super.key}); 

 

  // This widget is the root of your application. 

  @override 

  Widget build(BuildContext context) { 

    return MaterialApp( 

      debugShowCheckedModeBanner: false, 

      title: 'Quản Lý Tài Sản', 

      theme: ThemeData( 

        primarySwatch: Colors.blue, 

      ), 

      home: quan_li_tai_san(), 

    ); 

  } 

} 