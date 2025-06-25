import 'package:flutter/material.dart';
import 'package:sushi/core/utils/assets_manger.dart';
import 'package:sushi/core/utils/color_manger.dart';
import 'package:sushi/routing/routes.dart';

import '../../core/utils/constans.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _startAnimation(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to" + AppConstants.appName,
                  style: TextStyle(
                    fontSize: 28,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstants.mPlusRounded,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  AssetsManager.splashScreenLogo,
                  width:
                      (size.height > size.width)
                          ? size.width * 0.8
                          : size.height * 0.8,
                  height:
                      (size.height > size.width)
                          ? size.width * 0.8
                          : size.height * 0.8,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _startAnimation(Function callback) {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: AppConstants.splashDelay),
      animationBehavior: AnimationBehavior.preserve,
    );
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          _navigateToOnBoarding();
        }
      });
    });
  }

  void _navigateToOnBoarding() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}
