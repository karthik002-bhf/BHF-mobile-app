import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class PlanAndDesignScreen extends StatelessWidget {
  PlanAndDesignScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Site Inspection",
            "description": "Site inspection is a crucial step in the construction process that involves a detailed evaluation of the work being carried out on-site. It ensures that all activities align with the approved plans, specifications, safety regulations, and quality standards.",
            "img": "assets/images/DesignServices/Site_inspection.jpg",
        },
        {
            "title": "Architecture",
            "description": "We offer complete architectural design solutions that balance innovation, sustainability, and functionality. Our team collaborates closely with you to bring your vision to life, from concept to construction drawings.",
            "img": "assets/images/DesignServices/architecture_design_freepik.jpg",
        },
        {
            "title": "2D Plans",
            "description": "Our detailed 2D plans provide accurate layouts, measurements, and technical specifications essential for construction, ensuring a seamless transition from paper to project.",
            "img": "assets/images/DesignServices/2D_plan_pixabay.jpg",
        },
        {
            "title": "Vastu Support",
            "description": "For clients seeking harmony and positive energy, we offer Vastu-compliant design support. We incorporate Vastu principles into modern layouts without compromising style or functionality.",
            "img": "assets/images/DesignServices/vastu_support_gemini.jpg",
        },
        {
            "title": "3D Elevations",
            "description": "We create stunning 3D elevation designs that give a realistic view of your project before execution, helping you visualize aesthetics, materials, and structures.",
            "img": "assets/images/DesignServices/3D_plan_vectezy.jpg",
        },
        {
            "title": "Structural Design",
            "description": "Our structural design services ensure your building’s safety, strength, and longevity. We integrate engineering principles to deliver solid foundations, frameworks, and support systems.",
            "img": "assets/images/DesignServices/structural_design_gemini.jpg",
        },
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Architecture",
            "price": "₹80 - ₹125 per sq.ft.*",
        },
        {
            "service": "2D Plans",
            "price": "₹10 – ₹20 per sq.ft.*",
        },
        {
            "service": "3D Elevations",
            "price": "₹6 – ₹12 per sq.ft.*",
        },
        {
            "service": "Structural Design",
            "price": "₹8 – ₹15 per sq.ft.*",
        },
        {
            "service": "Vastu Support",
            "price": "complementary ",
        },
    ];

   final features = [
        {
            'id': 1,
            'title': "Expertise & Experience",
            'icon': Icons.groups,
        },
        {
            'id': 2,
            'title': "Tailored Design Solutions",
            'icon': Icons.build,
        },
        {
            'id': 3,
            'title': "High-Quality Material Selection",
            'icon': Icons.verified,
        },
        {
            'id': 4,
            'title': "Timely Service",
            'icon': Icons.access_time,
        },
        {
            'id': 5,
            'title': "Transparent Pricing",
            'icon': Icons.currency_rupee,
        }
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Planning & Design')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Planning & Design',
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
                      text: "Plan, Design & Architecture",
                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text:
                          " play a crucial role in shaping both residential and commercial buildings. In residential projects, careful planning ensures optimal use of space, ventilation, and natural light for comfortable living. Design adds aesthetic value while meeting functional needs like privacy, safety, and storage. In commercial buildings, architectural design focuses on space efficiency, accessibility, and creating a professional environment that suits business operations. A well-thought-out combination of plan, design, and architecture ensures both types of buildings are practical, appealing, and aligned with user needs.",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
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
                      text: "3D and Elevation Designs & Drawings",
                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text:
                          " provide a realistic visual representation of residential and commercial buildings before construction begins. They help clients and builders understand the building’s external appearance, material finishes, and design elements. These visual tools aid in better decision-making, design approval, and showcase the project’s aesthetic appeal and functionality.",
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
