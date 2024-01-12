import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    required this.height,
    required this.width,
    super.key,
    this.color,
  });

  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    );
  }
}
