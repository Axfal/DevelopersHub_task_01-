// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zini_pay_app/screen/home_screen.dart';

import '../components/colors.dart';
import '../components/reuse_button.dart';
import '../components/text_style.dart';
import '../provider/auth_view_model.dart';

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
  final TextEditingController apiKeyController = TextEditingController();

  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  void _submitForm() {
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false);
    if (_formKey.currentState!.validate()) {
      Map data = {
      'email' : emailController.text.toString(),
        'apiKey' : apiKeyController.text.toString()
      };
      authViewModel.loginApi(data,
          context);
      // Perform the login action and navigate to the next screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
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
                        controller: apiKeyController,
                        obscureText: visibility,
                        decoration: InputDecoration(
                          labelText: 'Api Key',
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
                            onPressed: () {},
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