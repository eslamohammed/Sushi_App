import 'package:flutter/material.dart';
import 'package:sushi/feature/home/widget/custom_grid.dart';
import 'package:sushi/feature/home/widget/featured_cards.dart';

import '../../core/utils/assets_manger.dart';
import '../../core/utils/color_manger.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/values_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> featuredImages = [
    AssetsManager.featured1,
    AssetsManager.featured3,
    AssetsManager.featured2,
    AssetsManager.featured1,
  ];
  final List<int> price = [15, 20, 25, 50];
  List<Map<String, bool>> selectedOptions = [
    {'Avocado': false, 'Spicy Mayo': false, 'Wasabi': false, 'eslam': false},
    {'Avocado': false, 'Spicy Mayo': false},
    {
      'Avocado': false,
      // 'Spicy Mayo': false,
      // 'Wasabi': false,
    },
    {'Avocado': false, 'Spicy Mayo': false, 'Wasabi': false, 'egg': false},
  ];

  final List<String> featuredNames = [
    "Chef's Special",
    "Premium Nigiri Set",
    "Omakase Experience",
    "Chef's Special",
  ];
  final List<String> featuredDiscriptions = [
    "A curated selection of our finest sushi, featuring fresh tuna, salmon, and yellowtail, complemented by avocado, cucumber, and a hint of wasabi. Each piece is crafted with precision and care, offering a harmonious blend of flavors and textures.",
    "A luxurious assortment of the ocean's bounty, our Premium Nigiri Set presents an exquisite selection of hand-pressed sushi. Featuring perfectly sliced, glistening cuts of tuna, salmon, amberjack, and scallops, each piece is delicately placed atop seasoned sushi rice. Complemented by a whisper of fresh wasabi and served with our finest soy sauce, this set highlights the natural sweetness and pristine texture of the fish, offering a truly refined nigiri experience.",
    "Embark on a culinary journey guided by our master sushi chef, as they present a personalized progression of the day's freshest and most exquisite ingredients. Our Omakase Experience features a series of innovative and traditional creations, showcasing the chef's artistry and deep understanding of flavor. Expect a delightful progression of seasonal fish, unique preparations, and surprising delicacies, meticulously crafted to offer an unparalleled and unforgettable dining adventure.",
    "A curated selection of our finest sushi, featuring fresh tuna, salmon, and yellowtail, complemented by avocado, cucumber, and a hint of wasabi. Each piece is crafted with precision and care, offering a harmonious blend of flavors and textures.",
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
            sushiDescription: featuredDiscriptions,
            selectedOptions: selectedOptions,
            price: price,
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
