import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    required this.initialQuantity,
    required this.isMetric,
    required this.onQuantityChanged,
    this.enabled,
  });

  final double initialQuantity;
  final bool isMetric; // true for 0.1 step, false for 1 step
  final ValueChanged<double>? onQuantityChanged;
  final bool? enabled;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late TextEditingController _controller;
  late double quantity;
  late double step;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    step = widget.isMetric ? 0.1 : 1.0;
    _controller = TextEditingController(text: _formatQuantity(quantity));
  }

  String _formatQuantity(double value) {
    return widget.isMetric
        ? value.toStringAsFixed(1)
        : value.toInt().toString();
  }

  void _increment() {
    if (widget.enabled != null && widget.enabled!) {
      setState(() {
        quantity = double.parse((quantity + step).toStringAsFixed(1));
        _controller.text = _formatQuantity(quantity);
      });
      widget.onQuantityChanged?.call(quantity);
    } else if (widget.enabled == null) {
      setState(() {
        quantity = double.parse((quantity + step).toStringAsFixed(1));
        _controller.text = _formatQuantity(quantity);
      });
      widget.onQuantityChanged?.call(quantity);
    }
  }

  void _decrement() {
    if (widget.enabled != null && widget.enabled!) {
      if (quantity > step) {
        setState(() {
          quantity = double.parse((quantity - step).toStringAsFixed(1));
          _controller.text = _formatQuantity(quantity);
        });
        widget.onQuantityChanged?.call(quantity);
      }
    } else if (widget.enabled == null) {
      if (quantity > step) {
        setState(() {
          quantity = double.parse((quantity - step).toStringAsFixed(1));
          _controller.text = _formatQuantity(quantity);
        });
        widget.onQuantityChanged?.call(quantity);
      }
    }
  }

  void _onTextChanged(String value) {
    final parsed = double.tryParse(value);
    if (parsed != null && parsed >= step) {
      quantity = parsed;
      _controller.text = _formatQuantity(quantity);
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      widget.onQuantityChanged?.call(quantity);
    } else if (value.isEmpty) {
      // Allow empty input for editing
    } else {
      // Revert to last valid
      _controller.text = _formatQuantity(quantity);
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey.shade400, width: 1),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: _decrement,
            icon: Icon(Icons.remove),
            color: Colors.red,
          ),
          Container(
            constraints: BoxConstraints(minWidth: 40, maxWidth: 60),
            // padding: const EdgeInsets.symmetric(horizontal: 8),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            //   border: Border.all(color: Colors.grey.shade400, width: 1.5),
            //   color: Colors.grey.shade100,
            // ),
            child: TextField(
              enabled: widget.enabled,
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}')),
              ],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              onChanged: _onTextChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          IconButton(
            onPressed: _increment,
            icon: Icon(Icons.add),
            color: Colors.green,
          ),
        ],
      ),
      // const SizedBox(height: 8),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class QuantitySelector extends StatefulWidget {
//   const QuantitySelector({
//     super.key,
//     required this.initialQuantity,
//     required this.isMetric,
//     this.onQuantityChanged,
//     this.onAddToCart,
//   });

//   final double initialQuantity;
//   final bool isMetric; // true for 0.1 step, false for 1 step
//   final ValueChanged<double>? onQuantityChanged;
//   final VoidCallback? onAddToCart;

//   @override
//   State<QuantitySelector> createState() => _QuantitySelectorState();
// }

// class _QuantitySelectorState extends State<QuantitySelector> {
//   late TextEditingController _controller;
//   late double quantity;
//   late double step;

//   @override
//   void initState() {
//     super.initState();
//     quantity = widget.initialQuantity;
//     step = widget.isMetric ? 0.1 : 1.0;
//     _controller = TextEditingController(text: quantity.toString());
//   }

//   void _increment() {
//     setState(() {
//       // quantity = double.parse((quantity + step).toStringAsFixed(1));
//       // quantity = widget.isMetric
//       //     ? double.parse((quantity + step).toStringAsFixed(1))
//       //     : int.parse((quantity + step).toString());
//       quantity = widget.isMetric
//           ? double.parse((quantity + step).toStringAsFixed(1))
//           : double.parse((quantity + step).toStringAsFixed(0));
//       _controller.text = quantity.toString();
//     });
//     widget.onQuantityChanged?.call(quantity);
//   }

//   void _decrement() {
//     if (quantity > step) {
//       setState(() {
//         quantity = double.parse((quantity - step).toStringAsFixed(1));
//         // quantity = widget.isMetric
//         //     ? double.parse((quantity - step).toStringAsFixed(1))
//         //     : int.parse((quantity - step).toString());
//         _controller.text = quantity.toString();
//       });
//       widget.onQuantityChanged?.call(quantity);
//     }
//   }

//   void _onTextChanged(String value) {
//     final parsed = double.tryParse(value);
//     if (parsed != null && parsed >= step) {
//       quantity = parsed;
//       widget.onQuantityChanged?.call(quantity);
//     } else if (value.isEmpty) {
//       // Allow empty for user editing, don't update quantity yet
//     } else {
//       // If invalid or below step, revert to last valid quantity
//       _controller.text = quantity.toString();
//       _controller.selection = TextSelection.fromPosition(
//         TextPosition(offset: _controller.text.length),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             IconButton(
//               onPressed: _decrement,
//               icon: Icon(Icons.remove),
//               color: Colors.red,
//             ),
//             Container(
//               constraints: BoxConstraints(minWidth: 60, maxWidth: 80),
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey.shade400, width: 1.5),
//                 color: Colors.grey.shade100,
//               ),
//               child: TextField(
//                 controller: _controller,
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}')),
//                 ],
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 onChanged: _onTextChanged,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(vertical: 8),
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: _increment,
//               icon: Icon(Icons.add),
//               color: Colors.green,
//             ),
//           ],
//         ),
//         const SizedBox(width: 16),
//         ElevatedButton(
//           onPressed: widget.onAddToCart,
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           ),
//           child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class QuantitySelector extends StatefulWidget {
//   const QuantitySelector({
//     super.key,
//     required this.initialQuantity,
//     required this.isMetric,
//     this.onQuantityChanged,
//     this.onAddToCart,
//   });

//   final double initialQuantity;
//   final bool isMetric; // true for metric (0.1 step), false for normal (1 step)
//   final ValueChanged<double>? onQuantityChanged;
//   final VoidCallback? onAddToCart;

//   @override
//   State<QuantitySelector> createState() => _QuantitySelectorState();
// }

// class _QuantitySelectorState extends State<QuantitySelector> {
//   late double quantity;
//   late double step;

//   @override
//   void initState() {
//     super.initState();
//     quantity = widget.initialQuantity;
//     step = widget.isMetric ? 0.1 : 1.0;
//   }

//   void _increment() {
//     setState(() {
//       quantity = double.parse((quantity + step).toStringAsFixed(1));
//     });
//     widget.onQuantityChanged?.call(quantity);
//   }

//   void _decrement() {
//     if (quantity > step) {
//       setState(() {
//         quantity = double.parse((quantity - step).toStringAsFixed(1));
//       });
//       widget.onQuantityChanged?.call(quantity);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             border: Border.all(color: Colors.grey.shade400, width: 1.5),
//             color: Colors.grey.shade100,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: _decrement,
//                 icon: Icon(Icons.remove),
//                 color: Colors.red,
//               ),
//               // Quantity Text with rounded border
//               // Container(
//               //   padding: const EdgeInsets.symmetric(
//               //     horizontal: 16,
//               //     vertical: 8,
//               //   ),
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(12),
//               //     border: Border.all(color: Colors.grey.shade400, width: 1.5),
//               //     color: Colors.grey.shade100,
//               //   ),
//               //   child:
//                  Text(
//                   quantity.toString(),
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               // ),
//               // Increment Button
//               IconButton(
//                 onPressed: _increment,
//                 icon: Icon(Icons.add),
//                 color: Colors.green,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 16),
//         // Add to Cart Button
//         ElevatedButton(
//           onPressed: widget.onAddToCart,
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           ),
//           child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
//         ),
//       ],
//     );
//   }
// }
