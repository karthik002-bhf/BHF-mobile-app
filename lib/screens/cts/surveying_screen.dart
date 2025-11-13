import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class SurveyingScreen extends StatelessWidget {
  SurveyingScreen({super.key});

  final List<dynamic> services = [
    {
      'title': "Topo Survey",
      'description':
          "Detailed topographic survey to capture surface features, elevations, and contours to support site planning and design.",
      'img': "assets/images/Surveying/topo_survey.jpg",
    },
    {
      'title': "Property Survey",
      'description':
          "Accurate boundary and property demarcation for land ownership, documentation, and legal purposes.",
      'img': "assets/images/Surveying/property_survey.jpg",
    },
    {
      'title': "Layout Designing",
      'description':
          "Planning and marking plots, roads, and open areas in accordance with sanctioned layout plans.",
      'img': "assets/images/Surveying/layout_design.jpg",
    },
    {
      'title': "Building Setting Out",
      'description':
          "Transferring design dimensions from drawings to the physical ground for building construction.",
      'img': "assets/images/Surveying/building_up_phase2.jpg",
    },
    {
      'title': "Land Survey",
      'description':
          "Comprehensive land measurement using modern instruments to determine area, levels, and usage potential.",
      'img': "assets/images/Surveying/land_survey.jpg",
    },
  ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
    {
      "service": "Project Planning & Management",
      "price": "₹10 – ₹25 per sq.ft. (or project-based from ₹.50,000 onwards)",
    },
    {
      "service": "Construction Management",
      "price": "₹15 – ₹30 per sq.ft. (based on scope & complexity)",
    },
    {
      "service": "Cost Consultancy & Quantity Survey",
      "price": "₹3 – ₹8 per sq.ft. (or lump sum for smaller projects)",
    },
    {
      "service": "Quality Audits",
      "price": "₹5 – ₹10 per sq.ft. (or ₹5,000 – ₹25,000 per audit)",
    },
    {
      "service": "Valuations",
      "price":
          "₹10,000 – ₹15,000 per report (depending on property type & size)",
    },
  ];

  final features = [
    {
      'id': 1,
      'title': "Expertise & Experience",
      'icon': Icons.lightbulb_outline,
    },
    {
      'id': 2,
      'title': "High-End Equipment",
      'icon': Icons.precision_manufacturing,
    },
    {'id': 3, 'title': "Precision", 'icon': Icons.workspace_premium},
    {'id': 4, 'title': "Timely Service", 'icon': Icons.access_time},
    {'id': 5, 'title': "Transparent Pricing", 'icon': Icons.currency_rupee},
  ];

  // In your widget tree
  // PricingTable(pricingData: pricingData),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Surveying')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Surveying',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16, // Set a reasonable size
                    color: Colors.black, // Use a standard color
                    fontFamily: 'Roboto', // Or your app's default
                    decoration: TextDecoration.none, // No underline/highlight
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    // TextSpan(text: "This is normal text, but "),
                    TextSpan(
                      text: "Surveying",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " is a critical process in the planning and development of land for residential, commercial, and infrastructure projects. It ensures accurate boundary definition, elevation mapping, and layout planning. With our expert team and modern tools like Total Station and GPS, BHF Platform provides highly accurate and efficient surveying services. Accurate surveys reduce disputes, improve construction accuracy, and ensure smooth project execution from start to finish.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ExecutionProcess(
                processDescription: processDescriprion,
                executionProcess: services,
              ),
              const SizedBox(height: 8),
              PricingSection(pricingData: pricingData),
              const SizedBox(height: 8),
              WhyChooseUs(features: features),
            ],
          ),
        ),
      ),
    );
  }
}
