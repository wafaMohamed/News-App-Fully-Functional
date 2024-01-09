import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({Key? key, required this.text, this.textStyle}) : super(key: key);
  String text;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
