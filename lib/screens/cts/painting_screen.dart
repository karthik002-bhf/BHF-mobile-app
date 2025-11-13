import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class PaintingScreen extends StatelessWidget {
  PaintingScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Conceptual & RAL Support",
            "description": "We assist clients with conceptual design and RAL color selection to ensure the perfect visual and functional outcome for every project. Whether you're waterproofing, painting, or applying protective coatings, our experts help you choose finishes and color tones that align with your aesthetic vision, brand identity, and technical requirements. With guidance on texture, sheen, and shade matching using the standardized RAL color chart, we ensure your spaces look great and perform exceptionally in their environments.",
            'img': "assets/images/Painting/conceptual_design.jpg",
        },
        {
            "title": "Internal Painting",
            "description": "We offer professional internal painting services designed to enhance the look and feel of your indoor spaces. From living rooms and bedrooms to kitchens and office interiors, we use premium-quality paints that ensure smooth finishes, rich color, and long-lasting durability. Our team helps you choose the right shades and textures to match your style, and we take care to protect your furniture and flooring during the process. Whether it’s a fresh coat or a full color makeover, we deliver clean, precise, and beautiful results every time.",
            'img': "assets/images/Painting/profisional_interior_painting.jpg",
        },
        {
            "title": "External Painting",
            "description": "We provide expert external painting services to protect and beautify your building’s exterior. Our team uses weather-resistant, high-performance paints that withstand harsh sun, rain, and pollution. From residential homes to commercial complexes, we ensure even coverage, durable finishes, and aesthetic appeal. We also assist in color selection to suit your architectural style and environment. Proper surface preparation, crack filling, and waterproof coatings are part of our process to ensure long-term results and curb appeal.",
            'img': "assets/images/Painting/expert_external painting.jpg",
        }
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Conceptual and RAL Selection Support",
            "price": "₹2 – ₹5 per sq.ft.",
        },
        {
            "service": "Internal Painting",
            "price": "₹12 – ₹25 per sq.ft.",
        },
        {
            "service": "External Painting",
            "price": "₹15 – ₹30 per sq.ft.",
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
            "title": "Customized Solutions",
            "icon": Icons.build,
        },
        {
            "id": 3,
            "title": "Guaranteed Workmanship",
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
      appBar: AppBar(title: Text('Painting')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Painting Services',
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
                      text: "Painting",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " for new and existing residential and commercial buildings enhances both aesthetics and protection of surfaces. In new constructions, painting is part of the final finishing stage, providing a fresh, clean look and sealing surfaces from moisture and wear. For existing buildings, repainting can refresh the appearance, cover damage, and protect against environmental factors like sunlight, rain, and pollution. BHF Platform ensures Residential painting focuses on personal style and comfort, while commercial painting often emphasizes durability, branding, and professional appearance. Whether for new or existing buildings, proper surface preparation and quality materials are key to a long-lasting paint job.",
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
