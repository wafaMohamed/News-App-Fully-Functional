import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/const/app_theme/color_app_theme.dart';
import 'package:news_app_api/const/enums/vars.dart';
import 'package:news_app_api/presentation/widgets/drawer_widget.dart';
import 'package:news_app_api/services/utils/utils.dart';

import '../widgets/custom_tabs.dart';
import '../widgets/custom_text.dart';
import '../widgets/horizontal_spacing.dart';
import '../widgets/pagination_widget.dart';
import '../widgets/vertical_spacing.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({Key? key}) : super(key: key);

  @override
  State<HomeNewsScreen> createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;

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
          const VerticalSpacing(5),

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
              const HorizontalSpacing(25),
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
          const VerticalSpacing(10),
          //? pagination numbers
          newsType == NewsType.topTrending
              ? Container()
              : SizedBox(
                  //? to avoid overflow error
                  height: kBottomNavigationBarHeight,
                  child: Row(
                    children: [
                      PaginationWidget(
                        text: 'Prev',
                        function: () {
                          setState(() {
                            if (currentPageIndex == 0) {
                              currentPageIndex = 0;
                            } else if (currentPageIndex >= 0) {
                              currentPageIndex -= 1;
                            } else {}
                          });
                        },
                        roundedRectangleBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 12,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                  print("$currentPageIndex");
                                },
                                child: CircleAvatar(
                                    backgroundColor: currentPageIndex == index
                                        ? ColorAppTheme.darkIconsColor
                                        : Theme.of(context).cardColor,
                                    child: CustomText(
                                      text: "${index + 1}",
                                      textStyle: GoogleFonts.aBeeZee(
                                          fontWeight: FontWeight.w900),
                                    )),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const HorizontalSpacing(5),
                            itemCount: 5),
                      ),
                      const Spacer(),
                      PaginationWidget(
                        roundedRectangleBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        text: 'Next',
                        function: () {
                          if (currentPageIndex == 4) {
                            return;
                          }
                          setState(() {
                            currentPageIndex += 1;
                          });
                          print("$currentPageIndex");
                        },
                      ),
                    ],
                  ),
                )
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
