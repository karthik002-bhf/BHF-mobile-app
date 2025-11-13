import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.totalWithoutGst,
    required this.totalGst,
    required this.totalWithGst,
  });
  final double totalWithoutGst;
  final double totalGst;
  final double totalWithGst;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.shade100,
      margin: const EdgeInsets.all(2),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Total without GST: ₹${totalWithoutGst.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "GST Total: ₹${totalGst.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            const Divider(),
            Text(
              "Total with GST: ₹${totalWithGst.toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
