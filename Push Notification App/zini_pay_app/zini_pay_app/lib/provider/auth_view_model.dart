// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zini_pay_app/screen/home_screen.dart';

import '../components/utils.dart';
import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepository = AuthRepository();
  Future<dynamic> loginApi(dynamic data, context) async {
    _myRepository.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successfully", context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen())); // if login successfully go to home
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
