import 'package:flutter/material.dart';

import '../../../core/utils/style_manager.dart';
// import '../../../core/utils/values_manager.dart';

// // class FeaturedCards {
// //   final String name;
// //   final String imageAssetPath;
// //   final String id;

// //   FeaturedCards({
// //     required this.name,
// //     required this.imageAssetPath,
// //     required this.id,
// //   });
// // }

class HorizontalImageList extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> mailNames;
  const HorizontalImageList({
    super.key,
    required this.imageUrls,
    required this.mailNames,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 312,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imageUrls[index],
                        fit: BoxFit.contain,
                        width: 240,
                        height: 270,
                      ),
                    ),

                    Text(
                      mailNames[index],
                      style: headlineNew3.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
