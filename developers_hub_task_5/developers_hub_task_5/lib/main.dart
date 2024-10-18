// ignore_for_file: prefer_const_constructors

import 'package:developers_hub_task_5/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC-JJ9t4sySQ9ZpjDYY-stGfxENKNojl6I",
        appId: "1:459518543073:web:695a08a40704597d0c23a0",
        messagingSenderId: "459518543073",
        projectId: "developer-hub-task-5")
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
          primarySwatch: Colors.deepPurple),
      home: SplashScreen(),
    );
  }
}
