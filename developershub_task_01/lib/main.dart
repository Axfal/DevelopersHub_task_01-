// ignore_for_file: prefer_const_constructors

import 'package:developershub_task_01/view/bottom_navigation_screen.dart';
import 'package:developershub_task_01/view/authentication/login_screen.dart';
import 'package:developershub_task_01/view/authentication/sign_up_screen.dart';
import 'package:developershub_task_01/view/drawer/profile_screen.dart';
import 'package:developershub_task_01/view/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        BottomNavigationScreen.id: (context) => BottomNavigationScreen(),
        ViewProfileScreen.id: (context) => ViewProfileScreen(),
      },
    );
  }
}
