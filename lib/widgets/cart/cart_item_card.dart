import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/widgets/common/quantity_selector.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    required this.product,
    required this.qty,
    required this.total,
    required this.gstRate,
    required this.gstAmount,
    required this.productId,
    required this.enableActions,
    required this.quoteInfo,
    required this.item,
    required this.isChecked,
    this.onCheck,
    this.onDelete,
    required this.onQuantityChanged,
  });

  final Map product;
  final double qty;
  final double total;
  final int gstRate;
  final double gstAmount;
  final int productId;
  final bool enableActions;
  final dynamic quoteInfo;
  final dynamic item;
  final bool isChecked;
  final VoidCallback? onCheck;
  final VoidCallback? onDelete;
  final ValueChanged<double> onQuantityChanged;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final String? updatedPrice =
        widget.quoteInfo != null && widget.quoteInfo['quotedPrice'] != null
        ? (num.parse(widget.quoteInfo['quotedPrice'])).toStringAsFixed(2)
        : null;

    final String statusText = widget.item['quoteInfo'] != null
        ? (widget.item['quoteInfo']['status']?.toString() ?? 'Unknown')
        : (widget.item['status'] ? 'Submitted' : 'Not Submitted');

    final bool canUpdateDelete = widget.enableActions;

    void updateqty() async {
      try {
        var dio = Dio();
        final response = await dio.put(
          "${AppConstant.baseUrl}/cart/items/${widget.item['id']}/quantity",
          data: {"quantity": widget.qty},
          options: Options(
            headers: {'Authorization': 'Bearer ${AppConstant.token}'},
          ),
        );
        final qtyUpdResponse = response.data;
        if (!mounted) return;
        if (qtyUpdResponse['success'] == true) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Quantity updated Successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                qtyUpdResponse['message'] ??
                    'Failed to update quantity. Please try again.',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (error) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update Quantity. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product['brand_product_name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 12.0),
                  child: Image.network(
                    "${AppConstant.imageUrl}${widget.product['brand_image_url']}",
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (updatedPrice != null)
                        Row(
                          children: [
                            Text(
                              '₹${widget.product['price']}',
                              style: const TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '₹$updatedPrice',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '/${widget.product['unit_si']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      else
                        Text(
                          'Price: ₹${widget.product['price']}/${widget.product['unit_si']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        'Total: ₹${widget.total.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'GST (${widget.gstRate}%): ₹${widget.gstAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            'Status:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  (widget.item['status'] ||
                                      widget.item['quoteInfo'] != null)
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                QuantitySelector(
                  initialQuantity: widget.qty,
                  isMetric: widget.product['unit_si'] == 'MT',
                  onQuantityChanged: canUpdateDelete
                      ? widget.onQuantityChanged
                      : null,
                  enabled:
                      widget.enableActions, // Disable if no actions allowed
                ),
                const SizedBox(width: 10),
                Text(widget.product['unit_si'].toString()),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: canUpdateDelete
                      ? () {
                          updateqty();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canUpdateDelete
                        ? Colors.green
                        : Colors.grey,
                  ),
                  child: const Text("Update"),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (widget.quoteInfo == null) ...[
                  Checkbox(
                    value: widget.isChecked,
                    onChanged: (_) => widget.onCheck?.call(),
                  ),
                  const Text("Submit for Quote"),
                ],
                const Spacer(),
                // IconButton(
                //   icon: Icon(
                //     Icons.delete,
                //     color: canUpdateDelete ? Colors.red : Colors.grey,
                //   ),
                //   onPressed: canUpdateDelete ? widget.onDelete : null,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:bhf_mobile_app/common/config.dart';
// import 'package:bhf_mobile_app/widgets/common/quantity_selector.dart';
// import 'package:flutter/material.dart';

// class CartItemCard extends StatefulWidget {
//   const CartItemCard({
//     super.key,
//     required this.product,
//     required this.qty,
//     required this.total,
//     required this.gstRate,
//     required this.gstAmount,
//     required this.productId,
//     required this.enableActions,
//     required this.quoteInfo,
//     required this.item,
//     required this.isChecked,
//     this.onCheck,
//     this.onDelete,
//   });

//   final Map product;
//   final double qty;
//   final double total;
//   final int gstRate;
//   final double gstAmount;
//   final int productId;
//   final bool enableActions;
//   final dynamic quoteInfo;
//   final dynamic item;
//   final bool isChecked;
//   final VoidCallback? onCheck;
//   final VoidCallback? onDelete;

//   @override
//   State<CartItemCard> createState() => _CartItemCardState();
// }

// class _CartItemCardState extends State<CartItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     // double updQty = widget.qty;
//     // Check if quoteInfo contains an updatedPrice key
//     final String? updatedPrice =
//         widget.quoteInfo != null && widget.quoteInfo['quotedPrice'] != null
//         ? (num.parse(widget.quoteInfo['quotedPrice'])).toStringAsFixed(2)
//         : null;

//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 1,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.product['brand_product_name'],
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0, right: 12.0),
//                   child: Image.network(
//                     "${AppConstant.imageUrl}${widget.product['brand_image_url']}",
//                     width: 64,
//                     height: 64,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Show price with strike-through if updated price exists
//                       if (updatedPrice != null)
//                         Row(
//                           children: [
//                             Text(
//                               '₹${widget.product['price']}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 decoration: TextDecoration.lineThrough,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               '₹${updatedPrice}',
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '/${widget.product['unit_si']}',
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         )
//                       else
//                         Text(
//                           'Price: ₹${widget.product['price']}/${widget.product['unit_si']}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Total: ₹${widget.total.toStringAsFixed(2)}',
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'GST (${widget.gstRate}%): ₹${widget.gstAmount.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.teal,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Row(
//                         children: [
//                           const Text(
//                             'Status:',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             widget.item['quoteInfo'] != null
//                                 ? widget.item['quoteInfo']['status'].toString()
//                                 : widget.item['status']
//                                 ? 'Submitted'
//                                 : 'Not Submitted',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: widget.item['status']
//                                   ? Colors.green
//                                   : Colors.red,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(),
//             Row(
//               children: [
//                 QuantitySelector(
//                   initialQuantity: widget.product['unit_si'] == 'MT' ? 0.1 : 1,
//                   isMetric: widget.product['unit_si'] == 'MT' ? true : false,
//                   onQuantityChanged: (newQty) {},
//                 ),
//                 // SizedBox(
//                 //   width: 65,
//                 //   child: TextFormField(
//                 //     initialValue: item['quantity'].toString(),
//                 //     decoration: const InputDecoration(),
//                 //     enabled: enableActions,
//                 //   ),
//                 // ),
//                 const SizedBox(width: 10),
//                 Text(widget.product['unit_si'].toString()),
//                 const SizedBox(width: 12),
//                 ElevatedButton(
//                   onPressed: widget.enableActions ? () {} : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text("Update"),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Row(
//               children: [
//                 if (widget.quoteInfo == null)
//                   Checkbox(
//                     value: widget.isChecked,
//                     onChanged: (_) => widget.onCheck?.call(),
//                   ),
//                 if (widget.quoteInfo == null) const Text("Submit for Quote"),
//                 const Spacer(),
//                 // IconButton(
//                 //   icon: const Icon(Icons.delete, color: Colors.red),
//                 //   onPressed: enableActions ? onDelete : null,
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
