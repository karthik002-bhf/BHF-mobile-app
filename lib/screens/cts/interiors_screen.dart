import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class InteriorsScreen extends StatelessWidget {
  InteriorsScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Pooja room",
            "description": "The design should reflect a peaceful ambiance, incorporating elements like traditional wooden mandirs, marble platforms, or wall-mounted units, depending on the available space. Placement according to Vastu Shastra typically in the northeast corner of the home is often considered ideal",
            "img": "assets/images/Interiors/pooja_room.jpg",
        },
        {
            "title": "Modular Kitchen Design",
            "description": "We specialize in creating modular kitchen designs that are stylish, space-efficient, and tailored to your lifestyle. From layout planning to material selection, we deliver kitchens that blend functionality and aesthetics seamlessly.",
            "img": "assets/images/Interiors/modular_kitchen_design_pixabay.jpg",
        },
        {
            "title": "Living-Dining Designs",
            "description": "Our living and dining designs focus on creating harmonious, multifunctional spaces. We optimize layouts for flow and comfort while incorporating your taste and personality into every element.",
            "img": "assets/images/Interiors/living_dining_pixabay.jpg",
        },
        {
            "title": "Balcony Designs",
            "description": "Transform your balconies into cozy retreats or stylish social spaces. We offer creative solutions for all sizes, incorporating greenery, lighting, and functional furniture.",
            "img": "assets/images/Interiors/balcony_design_3D.png",
        },
        {
            "title": "Room Designs",
            "description": "Whether it's a bedroom, study, or guest room, we design rooms that reflect your preferences while ensuring maximum comfort, utility, and style.",
            "img": "assets/images/Interiors/room_design_3D.jpg",
        },
        {
            "title": "Wet Areas Designs",
            "description": "We craft practical and elegant designs for bathrooms, utility areas, and other wet spaces, focusing on waterproofing, material durability, and modern aesthetics.",
            "img": "assets/images/Interiors/wet_area_design_3D.png",
        }
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Modular Kitchen Design",
            "price": "₹500 – ₹2,500 per sq.ft.*",
        },
        {
            "service": "Living-Dining Designs",
            "price": "₹300 – ₹1,200 per sq.ft.*",
        },
        {
            "service": "Room Designs",
            "price": "₹250 – ₹1,000 per sq.ft.*",
        },
        {
            "service": "Wet Areas Designs",
            "price": "₹400 – ₹1,500 per sq.ft.*",
        },
        {
            "service": "Balcony Designs",
            "price": "₹300 – ₹1,000 per sq.ft.*",
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
      appBar: AppBar(title: Text('Interior Design')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Interior Design',
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
                      text: "Interior design",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " and execution play a key role in enhancing the functionality and aesthetic appeal of both residential and commercial spaces. In residential buildings, interior design focuses on creating comfortable, personalized, and efficient living environments. For commercial spaces, the design is tailored to support productivity, brand identity, and customer experience. Execution involves selecting materials, managing contractors, and ensuring that the outcome matches the approved design. A well-executed interior project balances style, function, and budget while transforming spaces into inspiring and practical environments.",
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
