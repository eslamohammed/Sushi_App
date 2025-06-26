import 'package:flutter/material.dart';
import 'package:sushi/feature/details/widget/options.dart';

import '../../core/utils/color_manger.dart';
import '../../core/utils/constans.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/values_manager.dart';
import '../../routing/routes.dart';

class SushiDetailsView extends StatelessWidget {
  final String imageUrl;
  final String mailNames;
  final String sushiDescription;
  final Map<String, bool> selectedOptions;
  final int price;

  const SushiDetailsView({
    super.key,
    required this.imageUrl,
    required this.mailNames,
    required this.sushiDescription,
    required this.selectedOptions,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryBg,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryBg,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.home);
            // Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: ColorManager.primary,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.s4),
                  bottomRight: Radius.circular(AppSize.s4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p16,
                right: AppPadding.p16,
                top: AppPadding.p20,
              ),
              child: Text(
                mailNames,
                style: headline1.copyWith(color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p16,
                right: AppPadding.p16,
                top: AppPadding.p20,
                bottom: AppPadding.p20,
              ),
              child: Text(
                sushiDescription,
                style: hintline.copyWith(color: ColorManager.grey),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p16,
                  right: AppPadding.p16,
                ),
                child: Text(
                  "Price",
                  style: headlineNew1.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p16,
                right: AppPadding.p16,
                bottom: AppPadding.p8,
              ),
              child: Text(
                "$price\$",
                style: hintline.copyWith(color: ColorManager.grey),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  left: AppPadding.p16,
                  right: AppPadding.p16,
                ),
                child: Text(
                  "Customization",
                  style: headlineNew1.copyWith(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(child: OptionsList(selectedOptions: selectedOptions)),
            Padding(
              padding: const EdgeInsets.only(
                // top: AppPadding.p8,
                left: AppPadding.p20,
                right: AppPadding.p20,
                bottom: AppPadding.p8,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(Routes.loginRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Add to Cart',
                    style: hintline.copyWith(
                      color: ColorManager.lightGrey,
                      fontSize: 18,
                      fontFamily: AppConstants.mPlusRounded,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
