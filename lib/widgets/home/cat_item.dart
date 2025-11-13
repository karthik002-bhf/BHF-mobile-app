import 'package:flutter/material.dart';
import 'package:bhf_mobile_app/common/config.dart';

class CatItem extends StatelessWidget {
  const CatItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
    required this.from,
  });

  final dynamic category;
  final void Function(dynamic) onSelectCategory;
  final String from;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // double imageWidth = width > 500 ? 160 : 90;
    double textSize = width > 500 ? 18 : 14;

    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onPrimary;
    // final textColor = colorScheme.primary;
    final highlightColor = colorScheme.secondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onSelectCategory(category);
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: highlightColor.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.07),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: from == 'cmart'
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            '${AppConstant.imageUrl}${category['category_image_url']}',
                            width: double.infinity,
                            height: double.infinity,
                            // width: imageWidth +40,
                            // height: imageWidth +5,
                            fit: BoxFit.fill,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            category['category_image_url'],
                            width: double.infinity,
                            height: double.infinity,
                            // width: imageWidth,
                            // height: imageWidth,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                category['name'],
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: 
                  textColor,
                  // Theme.of(context).colorScheme.primary,
                  // letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
