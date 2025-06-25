import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/core/utils/constans.dart';
import 'package:sushi/routing/app_router.dart';
import 'package:sushi/routing/routes.dart';

import 'core/utils/color_manger.dart';

class SushiApp extends StatelessWidget {
  final AppRouter appRouter;
  const SushiApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 3264),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: ColorManager.water,
          scaffoldBackgroundColor: ColorManager.white,
        ),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
