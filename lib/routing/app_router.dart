import 'package:flutter/material.dart';
import 'package:sushi/feature/details/sushi_details_view.dart';
import 'package:sushi/feature/home/home.dart';
import 'package:sushi/feature/splash/splash_screen.dart';
import 'package:sushi/routing/routes.dart';

import '../feature/login/login_view.dart';
import '../feature/onboarding/onboarding_view.dart';
import '../feature/register/register_view.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Home());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());

      // case Routes.detailsRoute:
      //   return MaterialPageRoute(builder: (_) => SushiDetailsView());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
