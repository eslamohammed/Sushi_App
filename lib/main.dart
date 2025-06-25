import 'package:flutter/material.dart';
import 'package:sushi/routing/app_router.dart';
import 'package:sushi/sushi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SushiApp(appRouter: AppRouter()));
}
