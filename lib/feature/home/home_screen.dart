import 'package:flutter/material.dart';
import 'package:sushi/feature/home/widget/custom_grid.dart';
import 'package:sushi/feature/home/widget/featured_cards.dart';

import '../../core/utils/assets_manger.dart';
import '../../core/utils/color_manger.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/values_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> featuredImages = [
    AssetsManager.featured1,
    AssetsManager.featured3,
    AssetsManager.featured2,
    AssetsManager.featured1,
  ];

  final List<String> featuredNames = [
    "Chef's Special",
    "Premium Nigiri Set",
    "Omakase Experience",
    "Chef's Special",
  ];

  final List<GridCardItem> menuGridItems = [
    GridCardItem(title: "Appetizers", imageAssetPath: AssetsManager.grid4),
    GridCardItem(title: "Sushi Rolls", imageAssetPath: AssetsManager.grid3),
    GridCardItem(title: "Sashimi", imageAssetPath: AssetsManager.grid2),
    GridCardItem(title: "Desserts", imageAssetPath: AssetsManager.grid1),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              image: DecorationImage(
                image: AssetImage(AssetsManager.homeScreen3x),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p12,
                top: AppPadding.p20,
                left: AppPadding.p16,
                right: AppPadding.p16,
              ),
              child: Text(
                "Featured",
                style: headlineNew1.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          HorizontalImageList(
            imageUrls: featuredImages,
            mailNames: featuredNames,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: AppPadding.p12,
                top: AppPadding.p20,
                left: AppPadding.p16,
                right: AppPadding.p16,
              ),
              child: Text(
                "Explore",
                style: headlineNew1.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          MenuGrid(items: menuGridItems),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
