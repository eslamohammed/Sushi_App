import 'package:flutter/material.dart';
import 'package:sushi/core/utils/color_manger.dart';
import 'package:sushi/feature/home/widget/custom_appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryBg,
      appBar: CustomAppBar(),
      body: Center(
        child: Text(
          'Welcome to Home Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
