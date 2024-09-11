// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:developershub_task_01/component/colors.dart';
import 'package:developershub_task_01/component/name_plate.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:flutter/material.dart';

class ViewProfileScreen extends StatefulWidget {
  static const String id = 'ViewProfileScreen';
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // Using PreferredSize to control AppBar height
        SizedBox(
          height: 200,
          child: AppBar(
            backgroundColor: AppColor.primaryColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'BottomNavigationScreen');
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: AppColor.buttonColor,
              ),
            ),
            elevation: 0, // Remove shadow for a flat look
          ),
        ),

        // The Circular Avatar positioned below the AppBar
        Positioned(
          top: 120, // Adjust this to control how much of the avatar is embedded
          left:
              MediaQuery.of(context).size.width / 2 - 180, // Center the avatar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75, // Set the radius of the avatar
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      fit: BoxFit.cover, // Ensure the image fills the space
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
                Text(
                  'Change Picture',
                  style: AppTextStyle.SubHeading_Style_1,
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'User Name',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                NamePlate(title: 'Amahle Ade'),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email id',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                NamePlate(title: 'anfal@gmail.com'),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Phone number',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                NamePlate(title: '03319026664'),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                NamePlate(title: '123345678'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 600,
          width: double.infinity,
        )
      ]),
    );
  }
}
