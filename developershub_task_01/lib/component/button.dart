// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:developershub_task_01/component/colors.dart';
import 'package:developershub_task_01/component/text_style.dart';
import 'package:flutter/material.dart';

class ReuseButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Widget? icon;
  const ReuseButton(
      {super.key, required this.title, required this.onPress, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              '$title',
              style: AppTextStyle.Button_Style,
            )),
            if (icon != null) // Conditionally display the icon
              Padding(
                padding: const EdgeInsets.only(left: 20.0), // Spacing between icon and text
                child: icon,
              ),
          ],
        ),
      ),
    );
  }
}
