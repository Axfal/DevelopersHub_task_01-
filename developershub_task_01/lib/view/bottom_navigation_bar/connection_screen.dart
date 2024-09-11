// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../component/text_style.dart';
class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              height: 5,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height, // Set a fixed height
                child: ListView.separated(itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpeg',
                          fit: BoxFit.cover, // Ensures the image fills the space
                          width: 45, // Set the width and height equal to the CircleAvatar's size
                          height: 45,
                        ),
                      ),
                    ),
                    title: Text(
                        'Amahle Ade',
                        style: AppTextStyle.SubHeading_Style_1
                    ),
                    subtitle: Text("'Here's a new friend suggestion; you might know them.",
                        style: AppTextStyle.SubHeading_Style_3),
                    trailing: Text('9/02/2024'),
                  );
                },
                    separatorBuilder: (context, index){
                      return Divider(
                        thickness: 1,
                        height: 10,
                      );
                    }, itemCount: 100)
            )
          ],
        ),
      ),
    );
  }
}
