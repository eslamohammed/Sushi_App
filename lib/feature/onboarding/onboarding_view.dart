import 'package:flutter/material.dart';
import 'package:sushi/core/utils/color_manger.dart';
import 'package:sushi/core/utils/constans.dart';
import 'package:sushi/feature/onboarding/onboarding_slider.dart';
import 'package:sushi/feature/onboarding/onboarding_view_model.dart';
import 'package:sushi/routing/routes.dart';

import '../../core/utils/assets_manger.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  _binding() {
    _viewModel.onStart();
  }

  @override
  void initState() {
    _binding();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnboardingSliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return _getContentWidget(snapshot.data!);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _getContentWidget(OnboardingSliderViewObject data) {
    return Scaffold(
      backgroundColor: ColorManager.primaryBg,
      // appBar: AppBar(
      //   backgroundColor: ColorManager.white,
      //   elevation: AppSize.s0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: ColorManager.water,
      //     statusBarBrightness: Brightness.light,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      //       child: Align(
      //         alignment: Alignment.centerRight,
      //         child: TextButton(
      //           onPressed: () {
      //             Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
      //           },
      //           child: Text(
      //             AppStrings.skip,
      //             textAlign: TextAlign.end,
      //             style: buttonText2.copyWith(color: ColorManager.secondary),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: PageView.builder(
        controller: pageController,
        itemCount: data.pageCount,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnboardingPage(
            onboardingSlider: data.onboardingSlider,
            data: data,
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.primaryBg,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_getBottomSheetWidget(data)],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(OnboardingSliderViewObject? data) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.primaryBg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < data!.pageCount; index++)
                Container(
                  width:
                      data.currentIndex == index ? AppSize.s11_5 : AppSize.s10,
                  height:
                      data.currentIndex == index ? AppSize.s11_5 : AppSize.s10,
                  margin: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        data.currentIndex == index
                            ? Border.all(
                              color: ColorManager.primaryBg,
                              width: AppSize.s1_5,
                            )
                            : null,
                    color:
                        data.currentIndex == index
                            ? ColorManager.white
                            : ColorManager.grey,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SizedBox(
              width: double.infinity, // يعرض الزر بعرض الشاشة المتاح
              child: ElevatedButton(
                onPressed: () {
                  data.currentIndex == data.pageCount - 1
                      ? Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.loginRoute)
                      : pageController.nextPage(
                        duration: const Duration(
                          milliseconds: AppConstants.sliderAnimationTime,
                        ),
                        curve: Curves.ease,
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  data.currentIndex == data.pageCount - 1
                      ? 'Get Started'
                      : 'Next',
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingSlider onboardingSlider;
  final OnboardingSliderViewObject data;
  const OnboardingPage({
    super.key,
    required this.onboardingSlider,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            image: DecorationImage(
              image: AssetImage(onboardingSlider.imagePath),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppSize.s0_4),
              bottomRight: Radius.circular(AppSize.s0_4),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s30),
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p16,
            right: AppPadding.p16,
            top: AppPadding.p20,
            bottom: AppPadding.p20,
          ),
          child: Text(
            onboardingSlider.header,
            style: headline1.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            // top: AppPadding.p16,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Text(
            onboardingSlider.body,
            style: bodyText1.copyWith(color: ColorManager.grey),
            textAlign:
                data.currentIndex == 1 ? TextAlign.start : TextAlign.center,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 225,
          child: (data.currentIndex == 1) ? _imgProjector() : Container(),
        ),
        const SizedBox(height: AppSize.s40),
      ],
    );
  }

  Widget _imgProjector() {
    List imageAssets = [
      AssetsManager.onBoardingFrame0,
      AssetsManager.onBoardingFrame1,
      AssetsManager.onBoardingFrame2,
      AssetsManager.onBoardingFrame3,
    ];
    return Padding(
      padding: const EdgeInsets.only(
        // top: AppPadding.p16,
        left: AppPadding.p16,
        right: AppPadding.p16,
      ),
      child: GridView.builder(
        itemCount: imageAssets.length,
        physics: NeverScrollableScrollPhysics(), // Disables scrolling
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 173 / 74,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print("hi index : $index");
              // do something when the image is tapped
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  imageAssets[index],
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
