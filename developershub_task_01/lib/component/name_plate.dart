// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NamePlate extends StatelessWidget {
  final title;
  const NamePlate({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 315,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 10),
        child: Text('$title',textAlign: TextAlign.left,),
      ),
    );
  }
}
