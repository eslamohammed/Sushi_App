import 'dart:async';

import 'package:sushi/feature/onboarding/onboarding_slider.dart';
import 'package:sushi/feature/bases/base_view_model.dart';

import '../../core/utils/assets_manger.dart';
import '../../core/utils/constans.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelIns, OnboardingViewModelOuts {
  final StreamController _streamController =
      StreamController<OnboardingSliderViewObject>();
  late final List<OnboardingSlider> _list;

  late int _currentPage;

  @override
  void onStart() {
    _currentPage = 0;
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void onDispose() {
    _streamController.close();
  }

  @override
  void onPageChanged(int index) {
    _currentPage = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<OnboardingSliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map(
        (onboardingSliderViewObject) => onboardingSliderViewObject,
      );

  void _postDataToView() {
    inputSliderViewObject.add(
      OnboardingSliderViewObject(
        onboardingSlider: _list[_currentPage],
        pageCount: _list.length,
        currentIndex: _currentPage,
      ),
    );
  }

  List<OnboardingSlider> _getSliderData() {
    return [
      OnboardingSlider(
        AppStrings.onBoardingHeader1,
        AppStrings.onBoardingBody1,
        AssetsManager.onBoarding1,
      ),
      OnboardingSlider(
        AppStrings.onBoardingHeader2,
        AppStrings.onBoardingBody2,
        AssetsManager.onBoarding2,
      ),
      OnboardingSlider(
        AppStrings.onBoardingHeader3,
        AppStrings.onBoardingBody3,
        AssetsManager.onBoarding3,
      ),
    ];
  }
}

abstract mixin class OnboardingViewModelIns {
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract mixin class OnboardingViewModelOuts {
  Stream<OnboardingSliderViewObject> get outputSliderViewObject;
}

class OnboardingSliderViewObject {
  OnboardingSlider onboardingSlider;
  int pageCount;
  int currentIndex;

  OnboardingSliderViewObject({
    required this.onboardingSlider,
    required this.pageCount,
    required this.currentIndex,
  });
}
