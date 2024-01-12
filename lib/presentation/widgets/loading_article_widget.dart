import 'package:flutter/material.dart';
import 'package:news_app_api/presentation/widgets/shimmer_effect.dart';
import 'package:news_app_api/services/utils/utils.dart';

class LoadingArticlesWidgets extends StatefulWidget {
  const LoadingArticlesWidgets({Key? key}) : super(key: key);

  @override
  State<LoadingArticlesWidgets> createState() => _LoadingArticlesWidgetsState();
}

class _LoadingArticlesWidgetsState extends State<LoadingArticlesWidgets> {
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
    return Expanded(
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
          }),
    );
  }
}
