import 'package:flutter/material.dart';

Widget styledText(
  String text,{double fontSize=20,FontWeight fontWeight = FontWeight.bold,Color }
){
  return Text(text,
  style: TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: Colors.black
  ),
  );
}