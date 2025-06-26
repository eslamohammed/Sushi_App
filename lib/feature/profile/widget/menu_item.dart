import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/color_manger.dart';
import '../../../core/utils/style_manager.dart';

class MenuItemTile extends StatelessWidget {
  final String svgAssetPath;
  final String text;
  final VoidCallback onTap;
  final Color? iconColor;

  const MenuItemTile({
    super.key,
    required this.svgAssetPath,
    required this.text,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SvgPicture.asset(
          svgAssetPath,
          width: 24,
          height: 24,
          colorFilter:
              iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
        ),
        title: Text(text, style: hintline.copyWith(color: ColorManager.white)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
