import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/const/app_theme/color_app_theme.dart';
import 'package:news_app_api/presentation/widgets/custom_text.dart';
import 'package:news_app_api/presentation/widgets/horizontal_spacing.dart';
import 'package:news_app_api/presentation/widgets/vertical_spacing.dart';
import 'package:news_app_api/services/utils/utils.dart';

import '../../const/app_style/style.dart';

class ArticlesWidgets extends StatelessWidget {
  const ArticlesWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getSizeOfScreen;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            height: 158,
            margin: const EdgeInsets.all(8),
            width: size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorAppTheme.blackColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 1),
                )
              ],
              gradient: LinearGradient(
                  stops: const [0.5, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary
                  ]),
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FancyShimmerImage(
                      height: size.height * 0.16,
                      width: size.width * 0.4,
                      boxFit: BoxFit.fill,
                      shimmerDuration: const Duration(seconds: 1),
                      shimmerBaseColor: ColorAppTheme.greyShade400,
                      imageUrl:
                          "https://contenthub-static.grammarly.com/blog/wp-content/uploads/2019/08/August-blog-header-Amplification.png"),
                ),
                const HorizontalSpacing(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Title" * 50,
                        textStyle: titleStyle,
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                      ),
                      const VerticalSpacing(12),
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: "🕞 Reading Time",
                          textStyle: titleStyle.copyWith(fontSize: 13),
                        ),
                      ),
                      const VerticalSpacing(20),
                      FittedBox(
                        child: CustomText(
                          maxLines: 1,
                          text: "🔗 21-5-2021- on Monday",
                          textStyle: titleStyle,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
