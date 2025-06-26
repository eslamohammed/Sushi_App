import 'package:flutter/material.dart';

import '../../../core/utils/style_manager.dart';
import '../../../routing/routes.dart';
import '../../details/sushi_details_view.dart';

class HorizontalImageList extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> mailNames;
  final List<String> sushiDescription;
  final List<Map<String, bool>> selectedOptions;
  final List<int> price;
  const HorizontalImageList({
    super.key,
    required this.imageUrls,
    required this.mailNames,
    required this.sushiDescription,
    required this.selectedOptions,
    required this.price,
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
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.detailsRoute);
                Navigator.push(
                  context, // The current BuildContext
                  MaterialPageRoute(
                    builder:
                        (context) => SushiDetailsView(
                          imageUrl: imageUrls[index],
                          mailNames: mailNames[index],
                          sushiDescription: sushiDescription[index],
                          selectedOptions: selectedOptions[index],
                          price: price[index],
                        ), // The new screen to navigate to
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Hero(
                          tag: "tag[$index]",
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.contain,
                            width: 240,
                            height: 270,
                          ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
