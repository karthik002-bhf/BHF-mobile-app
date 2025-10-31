import 'package:bhf_mobile_app/widgets/category_screen/prd_cat_item.dart';
import 'package:flutter/material.dart';

class PrdCatItems extends StatelessWidget {
  const PrdCatItems({super.key, required this.catItems, required this.from});

  final List<dynamic> catItems;
  final String from;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int count = width > 500 ? 6 : 3;
    // final cardColor = Theme.of(context).colorScheme.surface;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: catItems.length == 1
          ? catItems[0]['subCategories'].length
          : catItems.length,
      itemBuilder: (context, index) {
        final catItem = catItems.length == 1 ? catItems[0]['subCategories'][index] : catItems[index];

        return PrdCatItem(
          category: catItem,
          onSelectCategory: () {},
          from: from,
        );
      },
    );
  }
}
