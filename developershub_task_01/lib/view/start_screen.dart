// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:developershub_task_01/component/button.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const String id = "StartScreen";
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: screenSize.height * 0.414,
                  width: screenSize.width * 0.599,
                  child: Image(
                    image: AssetImage(
                      'assets/images/welcome_image.png',
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Text(
              'Discover Your\nDream Job here',
              textAlign: TextAlign.center,
              style: AppTextStyle.Topic_Style,
            ),
            SizedBox(height: 20,),
            Text(
              'Explore all the existing job roles based on your\n interest and study major',
              textAlign: TextAlign.center,
              style: AppTextStyle.Statement_Style,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ReuseButton(
                title: "Gets Started",
                onPress: () {
                  Navigator.pushNamed(context, 'LoginScreen');
                },
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
