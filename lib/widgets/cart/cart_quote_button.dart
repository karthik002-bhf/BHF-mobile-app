import 'package:flutter/material.dart';

class CartQuoteButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const CartQuoteButton({super.key, required this.enabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Get Best Quote",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}