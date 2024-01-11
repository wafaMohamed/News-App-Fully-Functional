import 'package:flutter/material.dart';
import 'package:news_app_api/const/app_theme/color_app_theme.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_them_provider.dart';

class Utils {
  BuildContext context;

  Utils(this.context);

  Size get getSizeOfScreen => MediaQuery.of(context).size;

  bool get getTheme => Provider.of<DarkThemeProvider>(context).darkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;

  Color get baseShimmerColor =>
      getTheme ? ColorAppTheme.greyShade500 : ColorAppTheme.greyShade200;

  Color get highlightShimmerColor =>
      getTheme ? ColorAppTheme.greyShade700 : ColorAppTheme.greyShade400;

  Color get widgetShimmerColor =>
      getTheme ? ColorAppTheme.greyShade600 : ColorAppTheme.greyShade100;
}
