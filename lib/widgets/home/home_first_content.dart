import 'package:bhf_mobile_app/screens/category_prds_screen.dart';
import 'package:flutter/material.dart';
import 'package:bhf_mobile_app/widgets/home/cat_item.dart';

class HomeFirstContent extends StatelessWidget {
  const HomeFirstContent({
    super.key,
    required this.catItems,
    required this.from,
  });

  final List<dynamic> catItems;
  final String from;

  void _selectedCategory(BuildContext context, dynamic category) {
    if (from == 'cmart') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => CategoryPrdsScreen(
            title: category['name'],
            slug: category['slug'],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int count = width > 500 ? 3 : 2;
    // final cardColor = Theme.of(context).colorScheme.surface;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 6 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: catItems.length,
      itemBuilder: (context, index) {
        final catItem = catItems[index];
        return CatItem(
          category: catItem,
          onSelectCategory: (category) {
            _selectedCategory(context, category);
          }, // handle tap callback
          from: from,
        );
      },
    );
  }
}
