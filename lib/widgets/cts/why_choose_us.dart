import 'package:flutter/material.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key, required this.features});
  final List<dynamic> features;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Why Choose Us?',style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: features.map((feature) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.width < 500 ? 2.7 : 4),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.blue[50],
                          child: Icon(
                            feature['icon'],
                            size: 32,
                            color: Colors.blue[800],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          feature['title'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
