import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/presentation/widgets/custom_text.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs(
      {super.key,
      required this.text,
      required this.function,
      required this.color,
      required this.fontSize});

  final String text;
  final Function function;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: text,
            textStyle: GoogleFonts.lobster(
              textStyle: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// to make user check on tab use if or enums
