// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:developershub_task_01/component/button.dart';
import 'package:developershub_task_01/component/colors.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visibility1 = true;
  bool visibility2 = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'LoginScreen');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account', style: AppTextStyle.Topic_Style),
              SizedBox(height: 20),
              Text(
                  "Create an account so you can explore all the\n existing jobs",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.SubHeading_Style_1),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'User name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter user name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator:
                            emailValidator, // Use emailValidator directly
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        obscureText: visibility1,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility1 = !visibility1;
                              });
                            },
                            icon: visibility1
                                ? Icon(Icons.visibility_off_sharp,
                                    color: AppColor.primaryColor)
                                : Icon(Icons.visibility,
                                    color: AppColor.primaryColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: visibility2,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility2 = !visibility2;
                              });
                            },
                            icon: visibility2
                                ? Icon(Icons.visibility_off_sharp,
                                    color: AppColor.primaryColor)
                                : Icon(Icons.visibility,
                                    color: AppColor.primaryColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter confirm password';
                          }
                          if (value != passwordController.text) {
                            return 'Password not matching';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ReuseButton(
                        title: "Sign Up",
                        onPress: _submitForm,
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'LoginScreen');
                        },
                        child: Text(
                          'Already have an account?',
                          style: AppTextStyle.SubHeading_Style_1,
                        ),
                      ),
                      SizedBox(height: 5),
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
                                  image:
                                      AssetImage('assets/images/google.png'))),
                          SizedBox(width: 5),
                          SizedBox(
                              height: 44,
                              width: 60,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/facebook.png'))),
                          SizedBox(width: 5),
                          SizedBox(
                              height: 44,
                              width: 60,
                              child: Image(
                                  image:
                                      AssetImage('assets/images/apple.png'))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
