import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  final bool isAllSelected;
  final VoidCallback onSelectAll;

  const CartHeader({super.key, required this.isAllSelected, required this.onSelectAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Select all for Quote",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Checkbox(
          value: isAllSelected,
          onChanged: (_) => onSelectAll(),
        )
      ],
    );
  }
}