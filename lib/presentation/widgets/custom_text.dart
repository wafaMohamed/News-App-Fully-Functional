import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.text,
      this.textStyle,
      this.maxLines,
      this.textAlign})
      : super(key: key);
  String text;
  TextStyle? textStyle;
  int? maxLines;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
