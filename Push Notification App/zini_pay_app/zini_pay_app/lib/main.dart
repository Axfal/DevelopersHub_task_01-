// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zini_pay_app/provider/auth_view_model.dart';
import 'package:zini_pay_app/provider/get_api_model.dart';
import 'package:zini_pay_app/screen/login_screen.dart';
import 'package:zini_pay_app/services/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthViewModel()),
        ChangeNotifierProvider(
            create: (_) => GetApiModel()) // Ensure this is a ChangeNotifier
      ],
      child: MaterialApp(
        navigatorKey: MyApp.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
