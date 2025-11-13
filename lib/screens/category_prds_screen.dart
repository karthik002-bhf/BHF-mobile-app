import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/widgets/cat_prds_screen/category_prds.dart';
import 'package:bhf_mobile_app/widgets/common/cart_icon.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryPrdsScreen extends StatefulWidget {
  const CategoryPrdsScreen({
    super.key,
    required this.title,
    required this.slug,
    this.subCatId,
  });
  final String title;
  final String slug;
  final int? subCatId;

  @override
  State<CategoryPrdsScreen> createState() => _CategoryPrdsScreenState();
}

class _CategoryPrdsScreenState extends State<CategoryPrdsScreen> {
  List<dynamic>? productsData;
  bool isLoading = true;

  void _getProducts() async {
    try {
      var dio = Dio();
      final response = await dio.get(
        "${AppConstant.baseUrl}/categories/${widget.slug}",
      );
      final productResponse = response.data['data'];
      List<dynamic> prds = [];
      if (widget.subCatId != null) {
        // Ensure products is a List and each item is a Map before filtering
        prds = (productResponse['products'] as List)
            .where(
              (e) =>
                  e['subCategory'] != null &&
                  e['subCategory']['id'] == widget.subCatId,
            )
            .toList();
      } else {
        prds = productResponse['products'] as List;
      }

      // final productResponse = response.data['data'];
      // var prds = [];
      // if(widget.subCatId != null){
      //   prds = productResponse.products.where((e)=> e['subCategory']['id'] == widget.subCatId).toList();
      // }else{
      //   prds = productResponse['data']['products'];
      // }
      // print('productResponse: $productResponse');
      setState(() {
        // productsData = productResponse['data'] as Map<String, dynamic>;
        productsData = prds;
        isLoading = false;
      });
    } catch (error) {
      print('error: $error');
      setState(() {
        productsData = [];
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
      content = CategoryPrds(prdsData: productsData!);
    }
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: content,
            ),
          ),
        ),
        CartIcon(cartItemCount: 20,),
      ],
    );
  }
}
