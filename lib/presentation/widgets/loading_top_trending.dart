import 'package:flutter/material.dart';
import 'package:news_app_api/presentation/widgets/vertical_spacing.dart';
import 'package:news_app_api/services/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_container.dart';

class TopTrendingShimmerEffectWidget extends StatelessWidget {
  const TopTrendingShimmerEffectWidget({
    required this.size,
    required this.baseShimmerColor,
    required this.highlightShimmerColor,
    super.key,
  });

  final Size size;
  final Color baseShimmerColor;
  final Color highlightShimmerColor;

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getSizeOfScreen;
    var widgetShimmerColor = Utils(context).widgetShimmerColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        child: Shimmer.fromColors(
          baseColor: baseShimmerColor,
          highlightColor: highlightShimmerColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomContainer(
                  height: size.height * 0.33,
                  width: double.infinity,
                  color: widgetShimmerColor,
                ),
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomContainer(
                    height: size.height * 0.050,
                    width: size.width * 0.7,
                    color: widgetShimmerColor,
                  ),
                ),
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomContainer(
                    height: size.height * 0.035,
                    width: size.width * 0.5,
                    color: widgetShimmerColor,
                  ),
                ),
              ),
              const VerticalSpacing(10),
            ],
          ),
        ),
      ),
    );
  }
}
