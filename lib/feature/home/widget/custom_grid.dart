import 'package:flutter/material.dart';

class GridCardItem {
  final String title;
  final String imageAssetPath;

  GridCardItem({required this.title, required this.imageAssetPath});
}

class GridMenuItemCard extends StatelessWidget {
  final String title;
  final String imageAssetPath;

  const GridMenuItemCard({
    super.key,
    required this.title,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageAssetPath,
            fit: BoxFit.cover,
            width: 173,
            height: 173,
          ),
        ),
        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class MenuGrid extends StatelessWidget {
  final List<GridCardItem> items;

  const MenuGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 173 / 221,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridMenuItemCard(
            title: items[index].title,
            imageAssetPath: items[index].imageAssetPath,
          );
        },
      ),
    );
  }
}
