import 'package:flutter/material.dart';
import 'package:sushi/core/utils/assets_manger.dart';
import 'package:sushi/feature/profile/widget/menu_item.dart';

import '../../core/utils/color_manger.dart';
import '../../core/utils/constans.dart';
import '../../core/utils/style_manager.dart';
import '../../routing/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(AssetsManager.profilePhoto),
              ),
              const SizedBox(height: 15),
              Text(
                'F A',
                style: headlineNew1.copyWith(color: ColorManager.white),
              ),
              const SizedBox(height: 8),
              Text(
                'fa@email.com',
                style: hintline.copyWith(color: ColorManager.grey),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account',
                  style: headlineNew1.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              MenuItemTile(
                text: 'Edit Profile',
                onTap: () {
                  print('Edit Profile tapped');
                },
                svgAssetPath: AssetsManager.editProfile,
              ),
              MenuItemTile(
                text: 'Change Password',
                onTap: () {
                  print('Change Password tapped');
                },
                svgAssetPath: AssetsManager.changePassword,
              ),
              MenuItemTile(
                text: 'Contact Us',
                onTap: () {
                  print('Contact Us tapped');
                },
                svgAssetPath: AssetsManager.contactUs,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Orders',
                  style: headlineNew1.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              MenuItemTile(
                text: 'Order History',
                onTap: () {
                  print('Order History tapped');
                },
                svgAssetPath: AssetsManager.orderHistory,
              ),
              MenuItemTile(
                text: 'Saved Addresses',
                onTap: () {
                  print('Saved Addresses tapped');
                },
                svgAssetPath: AssetsManager.savedAddresses,
              ),
              MenuItemTile(
                text: 'Payment Methods',
                onTap: () {
                  print('Payment Methods tapped');
                },
                svgAssetPath: AssetsManager.paymentMethods,
              ),
              const SizedBox(height: 50),
              SizedBox(
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Log out',
                    style: hintline.copyWith(
                      color: ColorManager.lightGrey,
                      fontSize: 18,
                      fontFamily: AppConstants.mPlusRounded,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
