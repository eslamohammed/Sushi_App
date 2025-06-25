import 'package:flutter/material.dart';

import '../../../core/utils/values_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p16,
          left: AppPadding.p16,
          right: AppPadding.p16,
        ),
        child: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // TODO: Handle menu action
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p16,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // TODO: Handle search action
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
