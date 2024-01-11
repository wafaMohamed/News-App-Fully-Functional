import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/const/app_assets/app_assets.dart';
import 'package:news_app_api/presentation/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_them_provider.dart';
import 'custom_list_tile.dart';
import 'custom_text.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      backgroundColor: Colors.blue,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flexible -> to avoid overfitting error in image
                  Flexible(
                      child: SvgPicture.asset(
                    AppAssets.newsBlueIconAssets,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  )
                      // Image.asset(
                      //   AppAssets.newspaperAssets,
                      //   width: 80,
                      //   height: 80,
                      // ),
                      ),
                  const VerticalSpacing(10),
                  CustomText(
                    text: 'News App',
                    textStyle: GoogleFonts.lobster(),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(20),
            CustomListTile(
              label: 'Home',
              function: () {},
              icon: IconlyLight.home,
            ),
            CustomListTile(
              label: 'BookMark',
              function: () {},
              icon: IconlyLight.bookmark,
            ),
            const Divider(
              thickness: 3,
            ),
            SwitchListTile(
              title: themeState.darkTheme
                  ? CustomText(text: 'Dark')
                  : CustomText(text: 'Light'),
              secondary: themeState.darkTheme
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              value: themeState.darkTheme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
