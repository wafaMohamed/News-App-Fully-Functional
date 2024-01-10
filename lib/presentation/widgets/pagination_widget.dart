import 'package:flutter/material.dart';

import '../../const/app_theme/color_app_theme.dart';
import 'custom_text.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.text,
    required this.function,
    required this.roundedRectangleBorder,
  });

  final String text;
  final Function function;
  final RoundedRectangleBorder roundedRectangleBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorAppTheme.darkIconsColor,
          elevation: 7,
          shape: roundedRectangleBorder),
      child: CustomText(text: text),
    );
  }
}
