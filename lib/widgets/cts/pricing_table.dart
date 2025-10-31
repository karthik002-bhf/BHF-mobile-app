import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  final List<Map<String, String>> pricingData;

  const PricingSection({required this.pricingData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pricing',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Transparent and competitive pricing for all our services',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          // padding: const EdgeInsets.all(8),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
            children: [
              // Table Header
              TableRow(
                decoration: BoxDecoration(color: Colors.grey[200]),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Service',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // Data Rows
              ...pricingData.map((data) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data['service'] ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data['price'] ?? ''),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 2),
        // Terms and Conditions footer
        Text(
          '* T&C - Final pricing may vary based on specific project requirements and site conditions.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
