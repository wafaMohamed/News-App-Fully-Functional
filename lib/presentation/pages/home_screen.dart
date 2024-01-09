import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/const/app_theme/color_app_theme.dart';
import 'package:news_app_api/const/enums/vars.dart';
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
  var newsType = NewsType.allNews;

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
          const SizedBox(
            height: 5,
          ),
          //? Taps (all news , top trending)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTabs(
                text: 'All News',
                function: () {
                  if (newsType != NewsType.allNews) {
                    return setState(() {
                      newsType = NewsType.allNews;
                    });
                  }
                },
                color: newsType == NewsType.allNews
                    ? Theme.of(context).cardColor
                    : ColorAppTheme.transparentColor,
                fontSize: newsType == NewsType.allNews ? 20 : 16,
              ),
              const SizedBox(
                width: 25,
              ),
              CustomTabs(
                text: 'Top Trending',
                function: () {
                  //? == (Equality Operator) is used to compare two values
                  if (newsType != NewsType.topTrending) {
                    return setState(() {
                      newsType = NewsType
                          .topTrending; //? (Assignment Operator)assign a value to a variable,and update the variable
                    });
                  }
                },
                color: newsType == NewsType.topTrending
                    ? Theme.of(context).cardColor
                    : ColorAppTheme.transparentColor,
                fontSize: newsType == NewsType.topTrending ? 20 : 16,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
/*
or :
  CustomTabs(
                text: 'All News',
                function: () {
                  if (newsType == NewsType.topTrending) {
                    return;
                  }
                  setState(() {
                    newsType =
                        NewsType.topTrending; // Use assignment operator =
                  });
                },
                color: newsType == NewsType.topTrending
                    ? Theme.of(context).cardColor
                    : ColorAppTheme.transparentColor,
                fontSize: newsType == NewsType.topTrending ? 20 : 16,
              ),
              CustomTabs(
                text: 'Top Trending',
                function: () {
                  //? == (Equality Operator) is used to compare two values
                  if (newsType == NewsType.allNews) {
                    return;
                  }
                  setState(() {
                    newsType = NewsType
                        .allNews; //? (Assignment Operator)assign a value to a variable,and update the variable
                  });
                },
                color: newsType == NewsType.allNews
                    ? Theme.of(context).cardColor
                    : ColorAppTheme.transparentColor,
                fontSize: newsType == NewsType.allNews ? 20 : 16,
              ),
*/
