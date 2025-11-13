import 'package:bhf_mobile_app/widgets/cts/execution_process.dart';
import 'package:bhf_mobile_app/widgets/cts/pricing_table.dart';
import 'package:bhf_mobile_app/widgets/cts/why_choose_us.dart';
import 'package:flutter/material.dart';

class PmcScreen extends StatelessWidget {
  PmcScreen({super.key});

  final List<dynamic> services = [
        {
            "title": "Construction Management/PMC",
            "description": "We offer end-to-end project planning and management services to ensure your construction or renovation project runs smoothly, stays on schedule, and within budget. From initial timelines to resource allocation, we oversee every detail for successful delivery.",
            "img": "assets/images/Pmc/project_plan_management.jpg",
        },
        {
            "title": "Costing & Quantity",
            "description": "We provide accurate cost estimation, budgeting, and quantity surveying to help you plan your finances wisely. Our team ensures that every rupee spent is accounted for, helping you avoid overruns and unexpected costs.",
            "img": "assets/images/Pmc/cost_consultancy_freepik.jpg",
        },
        {
            "title": "Site Management",
            "description": "Our construction management service ensures on-site coordination, contractor supervision, and compliance with safety and quality standards. We act as your trusted partner, ensuring each phase of construction is executed efficiently and transparently.",
            "img": "assets/images/Pmc/construction_mgmt.jpg",
        },
        {
            "title": "Quality Audits",
            "description": "Our quality audits focus on identifying construction flaws, material mismatches, or non-compliance with specifications. We provide clear, actionable insights to help you maintain high standards throughout your project lifecycle.",
            "img": "assets/images/Pmc/quality_audit.jpg",
        },
        {
            "title": "Valuations",
            "description": "We offer property and asset valuation services based on current market trends, structural conditions, and development potential. Whether you're buying, selling, or refinancing, our certified reports provide the clarity you need for confident decisions.",
            "img": "assets/images/Pmc/valuation_image.jpeg",
        }
    ];

  final String processDescriprion =
      'Our Engineering professionalism safeguarding your transition from dream home to reality.';

  final pricingData = [
        {
            "service": "Project Planning & Management",
            "price": "₹10 – ₹25 per sq.ft. (or project-based from ₹50,000 onwards)",
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
            "price": "₹10,000 – ₹15,000 per report (depending on property type & size)",
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
      appBar: AppBar(title: Text('PMC')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                'Project Management Consultancy',
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
                      text: "Project Management Consultancy (PMC)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          " ensures smooth planning, coordination, and execution of residential and commercial building projects. It involves managing timelines, budgets, quality, and resources to deliver projects efficiently and as per client expectations. BHF PMC services help minimize risks, improve communication, and ensure adherence to design and safety standards throughout the construction process.",
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
