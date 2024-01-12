import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/presentation/widgets/custom_text.dart';
import 'package:news_app_api/presentation/widgets/vertical_spacing.dart';

import '../../const/app_style/style.dart';
import '../../services/utils/utils.dart';

class TopTrendingWidget extends StatefulWidget {
  const TopTrendingWidget({super.key});

  @override
  State<TopTrendingWidget> createState() => _TopTrendingWidgetState();
}

class _TopTrendingWidgetState extends State<TopTrendingWidget> {
  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getSizeOfScreen;
    final Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                    imageUrl: "imageUrl",
                    height: size.height * 0.33,
                    width: double.infinity),
              ),
              const VerticalSpacing(10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                  text: "Title",
                  textStyle: titleStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.link,
                    ),
                  ),
                  SelectableText(
                    "13-3-2001",
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
