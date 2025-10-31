import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/models/static_data.dart';
import 'package:bhf_mobile_app/screens/profile_screen.dart';
// import 'package:bhf_mobile_app/widgets/home/about_us.dart';
import 'package:bhf_mobile_app/widgets/home/home_first_content.dart';
// import 'package:bhf_mobile_app/widgets/home/our_mission.dart';
// import 'package:bhf_mobile_app/widgets/home/our_motto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  List<dynamic> categoryData = [];
  void _getCatDate() async {
    // final url = Uri.https('$baseUrl/categories/all');
    // fetchBaseUrl('categories/all');
    try {
      var dio = Dio();
      final response = await dio.get("${AppConstant.baseUrl}/categories/all");

      // print(response);

      final categoryResponse = response.data;
      // print('categoryResponse: ${categoryResponse['data']}');

      setState(() {
        categoryData = categoryResponse['data'];
      });
    } catch (error) {
      // print('object');
      // print(error);
      setState(() {
        // errorMessage = "Failed to load categories: $e";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _getCatDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("categoryData: $categoryData");
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 182, 181, 181),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 161, 200, 161),
                Color.fromARGB(149, 116, 136, 117),
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              transform: GradientRotation(45),
            ),
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/BHF Logo A-01.png',
              width: 70,
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BHF Tech Solution',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Build Home Fine At Its First',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF317EBD),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // drawer screen
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => ProfileScreen()));
            },
            icon: Icon(Icons.account_circle_rounded),
            iconSize: 50,
            color: Color.fromARGB(255, 70, 73, 69),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffabcabc),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (categoryData.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF874C62),
                        Color(0x33874C62),
                        Color(0xF0874C62),
                      ],
                      begin: AlignmentGeometry.topLeft,
                      end: AlignmentGeometry.bottomRight,
                    ),
                    // color: Color(0xFF874C62),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // shadow color
                        spreadRadius: 2, // how much the shadow spreads
                        blurRadius: 8, // softness of the shadow
                        offset: Offset(0, 4), // x and y offset
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'C-Mart',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      HomeFirstContent(catItems: categoryData, from: 'cmart'),
                    ],
                  ),
                ),
              if (categoryData.isEmpty)
                Center(child: CircularProgressIndicator()),
              // const SizedBox(height: 14),
              // Text('Construction Tech services'),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 146, 198, 226),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // shadow color
                      spreadRadius: 2, // how much the shadow spreads
                      blurRadius: 8, // softness of the shadow
                      offset: Offset(0, 4), // x and y offset
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Construction Tech services',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    HomeFirstContent(catItems: ctsData, from: 'cts'),
                  ],
                ),
              ),
              // Text('About us'),
              const SizedBox(height: 14),
              // AboutUs(),
              // const SizedBox(height: 14),
              // OurMission(),
              // const SizedBox(height: 14),
              // OurMotto(),
            ],
          ),
        ),
      ),
    );
  }
}
