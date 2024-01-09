import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/presentation/widgets/drawer_widget.dart';
import 'package:news_app_api/services/utils/utils.dart';

import '../widgets/custom_tabs.dart';
import '../widgets/custom_text.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({Key? key}) : super(key: key);

  @override
  State<HomeNewsScreen> createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  @override
  Widget build(BuildContext context) {
    var color = Utils(context).getColor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: CustomText(
            text: 'News App',
            textStyle: GoogleFonts.lobster(
              color: color,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(children: [
          Row(children: [
            CustomTabs(
              text: 'All News',
              function: () {},
            ),
            CustomTabs(
              text: 'Top Trending',
              function: () {},
            )
          ]),
        ]),
      ),
    );
  }
}
