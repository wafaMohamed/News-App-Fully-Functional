import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/services/utils/utils.dart';

import 'loading_top_trending.dart';

class LoadingSwiperWidgets extends StatefulWidget {
  const LoadingSwiperWidgets({Key? key}) : super(key: key);

  @override
  State<LoadingSwiperWidgets> createState() => _LoadingSwiperWidgetsState();
}

class _LoadingSwiperWidgetsState extends State<LoadingSwiperWidgets> {
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
    return SizedBox(
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
    );
  }
}
