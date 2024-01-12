import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/const/enums/vars.dart';
import 'package:news_app_api/presentation/widgets/shimmer_effect.dart';
import 'package:news_app_api/services/utils/utils.dart';

import 'loading_top_trending.dart';

class LoadingWidgets extends StatefulWidget {
  const LoadingWidgets({required this.newsType, Key? key}) : super(key: key);
  final NewsType newsType;

  @override
  State<LoadingWidgets> createState() => _LoadingWidgetsState();
}

class _LoadingWidgetsState extends State<LoadingWidgets> {
  late Color baseShimmerColor, highlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColor = utils.baseShimmerColor;
    highlightShimmerColor = utils.highlightShimmerColor;
    widgetShimmerColor = utils.widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getSizeOfScreen;
    return widget.newsType == NewsType.topTrending
        ? SizedBox(
            height: size.height * 0.48,
            child: Swiper(
                autoplay: true,
                autoplayDelay: 8000,
                itemWidth: size.width * 0.9,
                layout: SwiperLayout.STACK,
                viewportFraction: 0.9,
                itemCount: 5,
                itemBuilder: (context, index) => TopTrendingShimmerEffectWidget(
                    size: size,
                    baseShimmerColor: baseShimmerColor,
                    highlightShimmerColor: highlightShimmerColor)

                //const TopTrendingWidget(),
                ),
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, int index) {
                return ArticlesShimmerEffectWidget(
                    size: size,
                    baseShimmerColor: baseShimmerColor,
                    highlightShimmerColor: highlightShimmerColor);
                //ArticlesWidgets();
              },
            ),
          );
  }
}
