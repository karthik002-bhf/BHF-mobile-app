import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class RepairAndRenovationScreen extends StatelessWidget {
  RepairAndRenovationScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Structural Assessment",
            "description": "We begin with a detailed structural assessment to evaluate the integrity of your building. Our team inspects visible and hidden signs of damage, wear, or stress, identifying any potential safety risks or weaknesses in the structure.",
            "img": "assets/images/Repair_Renovation/structural_assessment.jpg",
        },
        {
            "title": "Repair Design & Vetting",
            "description": "Based on the assessment, we create a customized repair plan. This includes technical drawings, material selection, and method recommendations. We also offer third-party vetting, if needed, to ensure compliance and quality assurance.",
            "img": "assets/images/Repair_Renovation/repair_design_vetting.jpg",
        },
        {
            "title": "Repair Executions",
            "description": "Our skilled professionals carry out the repairs with precision and care. From minor fixes to major restorations, we use quality materials and proven techniques to restore structural strength and improve longevity.",
            "img": "assets/images/Repair_Renovation/repair_execution.jpg",
        },
        {
            "title": "Post-Repair Maintenance",
            "description": "We provide comprehensive maintenance plans after repairs to ensure long-term structural health. Our follow-up services help prevent future issues and maintain the integrity of your property.",
            "img": "assets/images/Repair_Renovation/post_repair_maintainence.png",
        }
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Structural Assessment",
            "price": "₹3 – ₹6 per sq.ft. (or ₹1500 – ₹5000 per visit for small sites)",
        },
        {
            "service": "Repair Design & Vetting",
            "price": "₹5 – ₹10 per sq.ft.",
        },
        {
            "service": "Repair Executions",
            "price": "₹20 – ₹60 per sq.ft. (varies based on damage severity and materials used)",
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
      appBar: AppBar(title: Text('Repair & Renovations')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Repair & Renovations',
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
                      text: "Repairs and rehabilitation",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " are essential for maintaining the safety, functionality, and value of both new and existing residential and commercial buildings. In new buildings, minor repairs may be needed to address construction defects or settling issues that appear after occupancy. For existing structures, rehabilitation involves restoring or upgrading deteriorated components like structural elements, extension of floors, plumbing, or electrical systems. BHF Platform provides Residential repairs which focuses on comfort and liveability, while commercial rehabilitation may address compliance, safety, and operational efficiency.",
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
