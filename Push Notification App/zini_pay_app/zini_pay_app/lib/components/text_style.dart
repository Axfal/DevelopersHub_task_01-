// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  static const TextStyle Topic_Style = TextStyle(
      fontSize: 24, color: AppColor.primaryColor, fontWeight: FontWeight.bold);
  static const TextStyle Heading_Style = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.headingColor);
  static const TextStyle title_Style = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.buttonColor);
  static const TextStyle SubHeading_Style_1 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.headingColor);
  static const TextStyle SubHeading_Style_2 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primaryColor);
  static const TextStyle SubHeading_Style_3 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: AppColor.headingColor);
  static const TextStyle Statement_Style = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColor.headingColor,
  );
  static const TextStyle Button_Style = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: AppColor.buttonColor);
}