import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class WaterproofScreen extends StatelessWidget {
  WaterproofScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Acrylic Cementitious Solutions",
            "description": "Acrylic cementitious waterproofing solutions are a blend of polymer-modified cement and acrylic additives. They form a flexible, durable coating that adheres well to concrete and masonry surfaces. Ideal for wet areas like bathrooms, terraces, and water tanks, this solution provides excellent protection against water penetration, cracks, and weather damage while allowing the surface to breathe. It's easy to apply and is resistant to UV rays and efflorescence.",
            "img": "assets/images/Waterproofing/acrylic_cementitious_solution.png",
        },
        {
            "title": "Polyurethane (PU) Solutions",
            "description": "We provide Polyurethane (PU) waterproofing solutions that offer superior flexibility, seamless protection, and long-lasting durability. Ideal for surfaces prone to movement or heavy exposure to the elements—such as terraces, roofs, and balconies—our PU applications create a tough, elastic membrane that resists water, UV rays, and chemicals. Whether it's a residential or commercial property, our expertly applied PU coating ensures strong adhesion and reliable leak-proof performance even in the most demanding conditions.",
            "img": "assets/images/Waterproofing/polyurethane_solutions_from_advanced-chemsitry.jpg",
        },
        {
            "title": "Elastomeric and Food Grade Coating Services",
            "description": "We offer Elastomeric and Food Grade Coating services tailored for specialized environments. Our elastomeric coatings are flexible, breathable membranes designed to bridge cracks and protect exterior walls and roofs from water, UV, and weather damage. For food-grade areas, we use certified coatings that are safe, hygienic, and compliant with industry standards, ideal for food processing zones, commercial kitchens, and water tanks. These coatings provide a seamless, non-toxic, and easy-to-clean surface, ensuring long-term durability and safety in sensitive applications.",
            "img": "assets/images/Waterproofing/Elastomeric_and_Food_Grade_Coating_Services.jpg",
        },
        {
            "title": "Grouting Services",
            "description": "We provide professional grouting services to fill and seal cracks, gaps, or joints in concrete, tiles, and masonry structures. Our solutions are ideal for water seepage issues, structural repairs, and surface reinforcement. Whether it’s pressure grouting, cementitious grouting, or chemical injection grouting, we use high-quality materials and precise techniques to restore structural integrity and prevent water ingress. Common applications include basements, water tanks, tiled surfaces, and foundation cracks. Our team ensures clean, durable, and effective results tailored to your site’s needs.",
            "img": "assets/images/Waterproofing/grouting_service_from_i.pinimg.jpg",
        },

    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Acrylic Cementitious Solutions",
            "price": "₹45 - ₹85",
        },
        {
            "service": "Polyurethane Solutions",
            "price": "₹55 - ₹110",
        },
        {
            "service": "Elastomeric & Food Grade Coating Services",
            "price": "₹65 - ₹125",
        },
        {
            "service": "Grouting Services",
            "price": "₹35 - ₹75",
        }
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
      appBar: AppBar(title: Text('Waterproofing')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Waterproofing',
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
                      text: "Waterproofing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " for new and existing residential and commercial buildings is crucial for protecting structures from water damage. In new construction, waterproofing is integrated during the building process to ensure long-term protection and reduce future repair costs. For existing buildings, waterproofing involves identifying problem areas and applying solutions like sealants, membranes, or drainage systems. Residential properties focus on areas like bathrooms, roofs, and basements, while commercial buildings often require large-scale solutions for foundations and flat roofs. Whether for new or existing structures, BHF platform provides proper and economic waterproofing solutions which improves building lifespan, safety, and aesthetic.",
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
