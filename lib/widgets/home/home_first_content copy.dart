import 'package:bhf_mobile_app/screens/category_prds_screen.dart';
import 'package:bhf_mobile_app/widgets/home/cat_item.dart';
import 'package:flutter/material.dart';

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
    return GridView.builder(
      shrinkWrap: true, // important if inside scrollable
      physics:
          const NeverScrollableScrollPhysics(), // prevents nested scroll issues
      padding: const EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 6 / 5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: catItems.length,
      itemBuilder: (context, index) {
        final catItem = catItems[index];
        return Material(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            // alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 203, 213, 232).withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: CatItem(
              category: catItem,
              onSelectCategory: (category) {
                _selectedCategory(context, category);
              },
              from: from,
            ), // replace with CatItem(...)
          ),
        );
      },
    );
  }
}
