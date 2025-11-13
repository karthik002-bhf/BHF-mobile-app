import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/widgets/common/cart_icon.dart';
import 'package:bhf_mobile_app/widgets/common/quantity_selector.dart';
import 'package:bhf_mobile_app/widgets/prd_details/prd_description.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PrdDetailsScreen extends StatefulWidget {
  const PrdDetailsScreen({super.key, required this.prdItem});

  final dynamic prdItem;

  @override
  State<PrdDetailsScreen> createState() => _PrdDetailsScreenState();
}

class _PrdDetailsScreenState extends State<PrdDetailsScreen> {
  String choosenQuantity = '1';

  @override
  void initState() {
    super.initState();
    choosenQuantity = widget.prdItem['unit_si'] == 'MT' ? '0.1' : '1';
  }

  void addToCart() async {
    final values = {
      'product_id': widget.prdItem['id'],
      "user_id": AppConstant.userId,
      'quantity': choosenQuantity,
    };
    try {
      var dio = Dio();
      final response = await dio.post(
        "${AppConstant.baseUrl}/cart/add",
        data: values,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${AppConstant.token}',
          },
        ),
      );
      final cartResponse = response.data;
      print('cartResponse: $cartResponse');
    } catch (error) {
      print('Add to cart Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              widget.prdItem['brand_product_name'],
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
                    child: widget.prdItem['brand_image_url'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              '${AppConstant.imageUrl}${widget.prdItem['brand_image_url']}',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Text('No image found'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '₹ ${widget.prdItem['price'].toString()}/ ${widget.prdItem['unit_si']}',
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
                        initialQuantity: widget.prdItem['unit_si'] == 'MT'
                            ? 0.1
                            : 1,
                        isMetric: widget.prdItem['unit_si'] == 'MT'
                            ? true
                            : false,
                        onQuantityChanged: (newQuantity) {
                          // print('Quantity changed to $newQuantity');
                          choosenQuantity = newQuantity.toString();
                        },
                      ),
                      ElevatedButton(
                        onPressed: addToCart,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            23,
                            124,
                            46,
                          ),
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
                  PrdDescription(htmlContent: widget.prdItem),
                ],
              ),
            ),
          ),
        ),
        CartIcon(cartItemCount: 20),
      ],
    );
  }
}
