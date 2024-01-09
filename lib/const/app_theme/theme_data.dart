import 'package:flutter/material.dart';

import 'color_app_theme.dart';

class AppTheme {
  // context for button theme
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? ColorAppTheme.darkScaffoldColor
          : ColorAppTheme.lightScaffoldColor,
      primaryColor: isDarkTheme
          ? ColorAppTheme.darkCardColor
          : ColorAppTheme.lightCardColor,
      hintColor:
          isDarkTheme ? ColorAppTheme.greyShade400 : ColorAppTheme.greyShade700,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor:
            isDarkTheme ? ColorAppTheme.whiteColor : ColorAppTheme.blackColor,
        selectionColor: ColorAppTheme.blueColor,

        // selectionHandleColor: Colors.blue,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkTheme
                ? ColorAppTheme.whiteColor
                : ColorAppTheme.blackColor,
            displayColor: isDarkTheme
                ? ColorAppTheme.whiteColor
                : ColorAppTheme.blackColor,
          ),
      cardColor: isDarkTheme
          ? ColorAppTheme.darkCardColor
          : ColorAppTheme.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorScheme: ThemeData()
          .colorScheme
          .copyWith(
            secondary: isDarkTheme
                ? ColorAppTheme.darkIconsColor
                : ColorAppTheme.lightIconsColor,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          )
          .copyWith(
              background: isDarkTheme
                  ? ColorAppTheme.darkBackgroundColor
                  : ColorAppTheme.lightBackgroundColor),
    );
  }
}
