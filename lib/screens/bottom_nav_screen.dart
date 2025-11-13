import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/screens/cart_screen.dart';
import 'package:bhf_mobile_app/screens/categories_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/painting_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/repair_and_renovation_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/pmc_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/interiors_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/material_testing_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/waterproof_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/plan_and_design_screen.dart';
// import 'package:bhf_mobile_app/screens/cts/surveying_screen.dart';
import 'package:bhf_mobile_app/screens/home_screen.dart';
import 'package:bhf_mobile_app/screens/order_again_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  var isLoading = false;
  List<dynamic> categoryData = [];

  void _getCatData() async {
    try {
      var dio = Dio();
      final response = await dio.get("${AppConstant.baseUrl}/categories/all");
      final categoryResponse = response.data;
      setState(() {
        categoryData = categoryResponse['data'];
      });
    } catch (error) {
      print('error: $error');
      setState(() {
        categoryData = [];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCatData();
  }

  List<Widget> get _screens => [
    // PlanAndDesignScreen(),
    // SurveyingScreen(),
    // MaterialTestingScreen(),
    // InteriorsScreen(),
    // WaterproofScreen(),
    // PmcScreen(),
    // RepairAndRenovationScreen(),
    // PaintingScreen(),
    HomeScreen(categoryData: categoryData),
    CategoriesScreen(categoryData: categoryData),
    OrderAgainScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
