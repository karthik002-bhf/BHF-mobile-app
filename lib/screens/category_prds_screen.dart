import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/widgets/cat_prds_screen/category_prds.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryPrdsScreen extends StatefulWidget {
  const CategoryPrdsScreen({
    super.key,
    required this.title,
    required this.slug,
  });
  final String title;
  final String slug;

  @override
  State<CategoryPrdsScreen> createState() => _CategoryPrdsScreenState();
}

class _CategoryPrdsScreenState extends State<CategoryPrdsScreen> {
  Map<String, dynamic>? productsData;
  bool isLoading = true;

  void _getProducts() async {
    try {
      var dio = Dio();
      final response = await dio.get(
        "${AppConstant.baseUrl}/categories/${widget.slug}",
      );
      final productResponse = response.data;
      // print('productResponse: $productResponse');
      setState(() {
        productsData = productResponse['data'] as Map<String, dynamic>;
        isLoading = false;
      });
    } catch (error) {
      print('error: $error');
      setState(() {
        productsData = {};
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // print('prddta: $productsData');
    Widget content = isLoading
        ? Center(child: CircularProgressIndicator())
        : Center(child: Text('No products found for this category.'));

    if (productsData == null && !isLoading) {
      content = Center(child: Text('No products found for this category.'));
    }
    if (!isLoading) {
      content = CategoryPrds(prdsData: productsData!['products']);
    }
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: content,
        ),
      ),
    );
  }
}
