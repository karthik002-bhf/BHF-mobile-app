import 'package:bhf_mobile_app/widgets/cat_prds_screen/cat_prd.dart';
import 'package:flutter/material.dart';

class CategoryPrds extends StatelessWidget {
  const CategoryPrds({super.key, required this.prdsData});

  final List<dynamic> prdsData;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int count = width > 500 ? 3 : 2;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        childAspectRatio: 0.43,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: prdsData.length,
      itemBuilder: (context, index) {
        final prdItem = prdsData[index];

        return CatPrd(prdItem: prdItem);
      },
    );
  }
}
