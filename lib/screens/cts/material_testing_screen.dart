import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class MaterialTestingScreen extends StatelessWidget {
  MaterialTestingScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Soil Testing",
            "description": "We provide comprehensive testing of soil materials to determine their physical and chemical properties. Our tests include soil classification, compaction, moisture content, and more to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_soil.jpg",
        },
        {
            "title": "Water Testing",
            "description": "We provide comprehensive testing of water quality to ensure it meets safety and regulatory standards. Our tests include chemical analysis, microbiological testing, and physical assessments to guarantee safe drinking water and compliance with environmental regulations.",
            "img": "assets/images/LabTest/lab_testing_water.jpg",
        },
        {
            "title": "Steel Testing",
            "description": "We provide comprehensive testing of steel materials to determine their physical and chemical properties. Our tests include tensile strength, yield strength, and chemical composition analysis to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_steel.jpg",
        },
        {
            "title": "Concrete Testing",
            "description": "We provide comprehensive testing of concrete materials to determine their physical and chemical properties. Our tests include compressive strength, flexural strength, and chemical composition analysis to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_concrete.jpg",
        },
        {
            "title": "Blocks Testing",
            "description": "We provide comprehensive testing of block materials to determine their physical and chemical properties. Our tests include compressive strength, water absorption, and dimensional accuracy to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_blocks.jpg",
        },
        {
            "title": "Bricks Testing",
            "description": "We provide comprehensive testing of brick materials to determine their physical and chemical properties. Our tests include compressive strength, water absorption, and dimensional accuracy to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_bricks.jpg",
        },
        {
            "title": "Wood Testing",
            "description": "We provide comprehensive testing of wood materials to determine their physical and chemical properties. Our tests include moisture content, density, and chemical composition analysis to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_wood.jpg",
        },
        {
            "title": "Flooring Materials Testing",
            "description": "We provide comprehensive testing of flooring materials to determine their physical and chemical properties. Our tests include moisture content, density, and chemical composition analysis to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_flooring.jpg",
        },
        {
            "title": "Paints Testing",
            "description": "We provide comprehensive testing of paints and coatings to determine their physical and chemical properties. Our tests include adhesion, hardness, and chemical resistance analysis to ensure your construction project is built on a solid foundation.",
            "img": "assets/images/LabTest/lab_testing_paints.jpg",
        },
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Building Materials Testing",
            "price": "₹500 - ₹5,000 per test (varies by material)",
        },
        {
            "service": "Soil & Water Testing",
            "price": "₹2,000 - ₹10,000 per site/sample",
        },
    ];

   final features = [
        {
            "id": 1,
            "title": "Expertise & Experience",
            "icon": Icons.group,
        },
        {
            "id": 2,
            "title": "Tailored Design Solutions",
            "icon": Icons.build,
        },
        {
            "id": 3,
            "title": "High-Quality Material Selection",
            "icon": Icons.check_circle,
        },
        {
            "id": 4,
            "title": "Timely Service",
            "icon": Icons.access_time,
        },
        {
            "id": 5,
            "title": "Transparent Pricing",
            "icon": Icons.currency_rupee,
        }
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material Testing')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Material Testing',
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
                      text: "Material Testing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " is crucial for ensuring the quality and safety of construction materials and processes. It involves a series of tests conducted on various materials, including soil, concrete, and water, to assess their properties and compliance with industry standards. BHF prioritizes material testing to guarantee the integrity of all projects. By identifying potential issues early, material testing helps prevent costly delays and ensures that projects meet all regulatory requirements.",
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
