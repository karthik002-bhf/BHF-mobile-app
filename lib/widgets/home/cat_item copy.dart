import 'package:bhf_mobile_app/common/config.dart';
import 'package:flutter/material.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
    required this.from,
  });

  final dynamic category;
  final void Function() onSelectCategory;
  final String from;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double imageWidth = width > 500 ? 160 : 80;
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Colors.amber,
      // splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            if (from == 'cmart')
              Image.network(
                '${AppConstant.imageUrl}${category['category_image_url']}',
                width: imageWidth,
                height: imageWidth,
                fit: BoxFit.cover,
              ),

            if (from == 'cts')
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  // "assets/images/BHF Logo A-01.png",
                  category['category_image_url'],
                  width: imageWidth, // slightly smaller than 100
                  height: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            // Image.asset(
            //   category['category_image_url'],
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.cover,
            // ),
            // Image.asset(
            //   'assets/images/Surveying/property_survey.jpg',
            //   // category['category_image_url'],
            //   width: 10,
            //   height: 10,
            //   fit: BoxFit.cover,
            // ),
            Text(
              category['name'],
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
