import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/widgets/common/quantity_selector.dart';
import 'package:bhf_mobile_app/widgets/prd_details/prd_description.dart';
import 'package:flutter/material.dart';

class PrdDetailsScreen extends StatelessWidget {
  const PrdDetailsScreen({super.key, required this.prdItem});

  final dynamic prdItem;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          prdItem['brand_product_name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 400,
                child: prdItem['brand_image_url'] != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          '${AppConstant.imageUrl}${prdItem['brand_image_url']}',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Text('No image found'),
              ),
              SizedBox(height: 12),
              Text(
                '₹ ${prdItem['price'].toString()}/ ${prdItem['unit_si']}',
                style: TextStyle(
                  fontSize: width > 500 ? 22 : 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 41, 86, 104),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  QuantitySelector(
                    initialQuantity: prdItem['unit_si'] == 'MT' ? 0.1 : 1,
                    isMetric: prdItem['unit_si'] == 'MT' ? true : false,
                  ),
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
              SizedBox(height: 12),
              PrdDescription(htmlContent: prdItem),
            ],
          ),
        ),
      ),
    );
  }
}
