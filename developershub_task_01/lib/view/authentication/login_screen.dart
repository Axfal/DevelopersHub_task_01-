// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:developershub_task_01/component/button.dart';
import 'package:developershub_task_01/component/colors.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform the login action and navigate to the next screen
      Navigator.pushNamed(context, 'BottomNavigationScreen');
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Here', style: AppTextStyle.Topic_Style),
              SizedBox(height: 20),
              Text(
                "Welcome back you've\n been missed",
                textAlign: TextAlign.center,
                style: AppTextStyle.SubHeading_Style_1,
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator: emailValidator,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        obscureText: visibility,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: visibility
                                ? Icon(
                              Icons.visibility_off_sharp,
                              color: AppColor.primaryColor,
                            )
                                : Icon(
                              Icons.visibility,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator: passwordValidator,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Forgot your password?",
                            style: AppTextStyle.SubHeading_Style_2,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ReuseButton(
                        title: "Sign in",
                        onPress: _submitForm,
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'SignUpScreen');
                            },
                            child: Text(
                              'Create new account',
                              style: AppTextStyle.SubHeading_Style_1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'or continue with',
                            style: AppTextStyle.SubHeading_Style_2,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 44,
                            width: 60,
                            child: Image(
                              image: AssetImage('assets/images/google.png'),
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            height: 44,
                            width: 60,
                            child: Image(
                              image: AssetImage('assets/images/facebook.png'),
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            height: 44,
                            width: 60,
                            child: Image(
                              image: AssetImage('assets/images/apple.png'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
