import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/screens/prd_details_screen.dart';
import 'package:bhf_mobile_app/widgets/common/quantity_selector.dart';
import 'package:flutter/material.dart';

class CatPrd extends StatelessWidget {
  const CatPrd({super.key, required this.prdItem});

  final dynamic prdItem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double textSize = width > 500 ? 20 : 16;
    double imageHeight = width > 500 ? 270 : 170;
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.tertiary;
    final highlightColor = colorScheme.secondary;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 121, 172, 230),
            width: 2,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PrdDetailsScreen(prdItem: prdItem),
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            splashColor: highlightColor.withOpacity(0.3),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: imageHeight + 20,
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
                    child: prdItem['brand_image_url'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              '${AppConstant.imageUrl}${prdItem['brand_image_url']}',
                              width: imageHeight,
                              height: imageHeight,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Text('No image found'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '₹ ${prdItem['price'].toString()}/ ${prdItem['unit_si']}',
                  style: TextStyle(
                    fontSize: width > 500 ? 20 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 122, 178, 201),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  prdItem['brand_product_name'],
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuantitySelector(
                      isMetric: prdItem['unit_si'] == 'MT' ? true : false,
                      initialQuantity: prdItem['unit_si'] == 'MT' ? 0.1 : 1.0,
                      onQuantityChanged: (newQuantity) {
                        // Handle quantity change, e.g., update cart item
                        print('Quantity changed to $newQuantity');
                      },
                      onAddToCart: () {},
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: const Color.fromARGB(255, 23, 124, 46),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
