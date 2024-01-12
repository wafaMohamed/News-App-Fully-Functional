import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/const/app_theme/color_app_theme.dart';
import 'package:news_app_api/const/enums/vars.dart';
import 'package:news_app_api/presentation/widgets/drawer_widget.dart';
import 'package:news_app_api/services/utils/utils.dart';

import '../widgets/articles_widgets.dart';
import '../widgets/custom_drop_down_button.dart';
import '../widgets/custom_tabs.dart';
import '../widgets/custom_text.dart';
import '../widgets/horizontal_spacing.dart';
import '../widgets/pagination_widget.dart';
import '../widgets/top_trending_widget.dart';
import '../widgets/vertical_spacing.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({Key? key}) : super(key: key);

  @override
  State<HomeNewsScreen> createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  NewsType newsType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnums.publishedAt.name;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getSizeOfScreen;
    Color color = Utils(context).getColor;
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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(
          children: <Widget>[
            const VerticalSpacing(5),

            //? Taps (all news , top trending)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                      children: <Widget>[
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
                              itemBuilder: (BuildContext context, int index) {
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
                              separatorBuilder:
                                  (BuildContext context, int index) =>
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
                  ),
            const VerticalSpacing(10),
            newsType == NewsType.topTrending
                ? Container()
                : Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomDropdownButton(
                          value: sortBy,
                          items: [
                            SortByEnums.relevancy.name,
                            SortByEnums.publishedAt.name,
                            SortByEnums.popularity.name,
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              sortBy = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
            const VerticalSpacing(10),
            if (newsType == NewsType.topTrending)
              //const LoadingSwiperWidgets(),
              SizedBox(
                height: size.height * 0.48,
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 8000,
                  itemWidth: size.width * 0.9,
                  layout: SwiperLayout.STACK,
                  viewportFraction: 0.9,
                  itemCount: 5,
                  itemBuilder: (context, index) => const TopTrendingWidget(),
                ),
              ),

            if (newsType == NewsType.allNews)
              //LoadingArticlesWidgets
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, int index) {
                    return const ArticlesWidgets();
                  },
                ),
              ),
            // const LoadingArticlesWidgets()
          ],
        ),
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
