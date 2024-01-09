import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_them_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  bool get getTheme => Provider.of<DarkThemeProvider>(context).darkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;
}
