import 'package:bhf_mobile_app/models/static_data.dart';
import 'package:bhf_mobile_app/widgets/category_screen/prd_cat_items.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.categoryData});
  final List<dynamic> categoryData;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> infraKartData = widget.categoryData
        .where((e) => e['id'] != 14)
        .toList();
    final List<dynamic> ccData = widget.categoryData
        .where((e) => e['id'] == 14)
        .toList();

    final List<dynamic> dapData = ctsData
        .where((e) => [1, 2].contains(e['id']))
        .toList();

    final List<dynamic> pmsData = ctsData
        .where((e) => [3, 4].contains(e['id']))
        .toList();
    final List<dynamic> faiData = ctsData
        .where((e) => [5, 6, 7, 8].contains(e['id']))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE6EBF6), // Subtle blue
              Color(0xFFF3F6F9), // Very light grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'InfraKart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (infraKartData.isNotEmpty)
                PrdCatItems(catItems: infraKartData, from: 'cmart'),
              if (infraKartData.isEmpty)
                const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 14),
              Text(
                'Construction Chemicals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (ccData.isNotEmpty)
                PrdCatItems(catItems: ccData, from: 'cmart'),
              if (ccData.isEmpty)
                const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 14),
              Text(
                'Design & Planning',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              PrdCatItems(catItems: dapData, from: 'cts'),
              const SizedBox(height: 14),
              Text(
                'Project Management & Supervision',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              PrdCatItems(catItems: pmsData, from: 'cts'),
              const SizedBox(height: 14),
              Text(
                'Finishing & Interiors',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              PrdCatItems(catItems: faiData, from: 'cts'),
              const SizedBox(height: 14),
              // SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
