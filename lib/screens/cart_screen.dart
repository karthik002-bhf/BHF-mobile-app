import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/common/route_observer.dart';
import 'package:bhf_mobile_app/widgets/cart/cart_header.dart';
import 'package:bhf_mobile_app/widgets/cart/cart_item_card.dart';
import 'package:bhf_mobile_app/widgets/cart/cart_quote_button.dart';
import 'package:bhf_mobile_app/widgets/cart/cart_semmary.dart';
import 'package:bhf_mobile_app/widgets/cart/quote_submit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with RouteAware {
  List<dynamic> cartItems = [];
  bool isLoading = true;
  List<int> selectedItemIds = [];

  Future<void> _cartData() async {
    setState(() => isLoading = true);
    try {
      var dio = Dio();
      final response = await dio.get(
        "${AppConstant.baseUrl}/cart/user/${AppConstant.userId}",
        options: Options(
          headers: {'Authorization': 'Bearer ${AppConstant.token}'},
        ),
      );
      final cartResponse = response.data;
      setState(() {
        cartItems = cartResponse['data'] ?? [];
        selectedItemIds.clear();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        cartItems = [];
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when coming back to this screen
    _cartData(); // Reload cart items
  }

  @override
  void initState() {
    super.initState();
    _cartData();
  }

  bool get isAllSelected => cartItems
      .where((item) => item['quoteInfo'] == null)
      .map<int>((item) => item['id'] as int)
      .every((id) => selectedItemIds.contains(id));

  void toggleSelectAll() {
    setState(() {
      if (isAllSelected) {
        selectedItemIds.clear();
      } else {
        selectedItemIds = cartItems
            .where((item) => item['quoteInfo'] == null)
            .map<int>((item) => item['id'] as int)
            .toList();
      }
    });
  }

  void toggleSelect(int itemId) {
    setState(() {
      if (selectedItemIds.contains(itemId)) {
        selectedItemIds.remove(itemId);
      } else {
        selectedItemIds.add(itemId);
      }
    });
  }

  Future<bool?> showDeleteConfirmation(
    BuildContext context,
    int productId,
    int itemId,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this cart item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false), // Cancel
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true), // Confirm
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<bool> deleteItem(int productId, int itemId) async {
    try {
      var dio = Dio();
      final response = await dio.delete(
        "${AppConstant.baseUrl}/cart/item/$itemId",
        options: Options(
          headers: {'Authorization': 'Bearer ${AppConstant.token}'},
        ),
      );
      final cartDelResponse = response.data;
      // print('cartDelResponse: $cartDelResponse');
      if (!mounted) return false;
      if (cartDelResponse['success'] == true) {
        setState(() {
          cartItems.removeWhere((item) => item['Product']['id'] == productId);
          selectedItemIds.remove(itemId);
        });
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item deleted Successfully'),
            backgroundColor: Colors.green,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              cartDelResponse['message'] ??
                  'Failed to delete item. Please try again.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    } catch (error) {
      // print('error: $error');
      if (!mounted) return false;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete item. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  double get totalWithoutGst {
    double total = 0;
    for (var item in cartItems) {
      double price = _getPrice(item);
      double qty = double.tryParse(item['quantity'].toString()) ?? 0;
      total += price * qty;
    }
    return total;
  }

  double get totalGst {
    double gstSum = 0;
    for (var item in cartItems) {
      double price = _getPrice(item);
      double qty = double.tryParse(item['quantity'].toString()) ?? 0;
      double gstRate = (item['Product']['gst'] ?? 0).toDouble();
      gstSum += price * qty * gstRate / 100;
    }
    return gstSum;
  }

  double _getPrice(dynamic item) {
    final quoteInfo = item['quoteInfo'];
    final product = item['Product'];

    if (quoteInfo != null && quoteInfo['quotedPrice'] != null) {
      var quoted = quoteInfo['quotedPrice'];
      if (quoted is int) return quoted.toDouble();
      if (quoted is double) return quoted;
      return double.tryParse(quoted.toString()) ??
          (product['price']?.toDouble() ?? 0);
    } else {
      var normalPrice = product['price'];
      if (normalPrice is int) return normalPrice.toDouble();
      if (normalPrice is double) return normalPrice;
      return double.tryParse(normalPrice.toString()) ?? 0;
    }
  }

  double get totalWithGst => totalWithoutGst + totalGst;

  // Assuming you have access to quoteArray in this scope to pass to QuoteSubmit

  void openQuoteSubmit(BuildContext context, List<int> quoteArray) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false, // disables swipe-to-dismiss
      backgroundColor: Colors.transparent, // so container color is visible
      builder: (ctx) {
        return QuoteSubmit(
          quoteArray: quoteArray,
          onClose: () => Navigator.of(ctx).pop(),
        );
      },
    );
  }

  // Then in your CartQuoteButton usage:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _cartData,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 14,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 180, 214, 242),
                      const Color.fromARGB(255, 152, 193, 227),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    CartHeader(
                      isAllSelected: isAllSelected,
                      onSelectAll: toggleSelectAll,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, idx) {
                          final item = cartItems[idx];
                          final product = item['Product'];
                          final quoteInfo = item['quoteInfo'];
                          final productId = product['id'] as int;

                          final qty =
                              double.tryParse(item['quantity'].toString()) ?? 0;
                          final price = () {
                            if (quoteInfo != null &&
                                quoteInfo['quotedPrice'] != null &&
                                quoteInfo['quotedPrice']
                                    .toString()
                                    .isNotEmpty) {
                              // Parse quotedPrice to double
                              return double.tryParse(
                                    quoteInfo['quotedPrice'].toString(),
                                  ) ??
                                  product['price'] ??
                                  0;
                            } else {
                              return product['price'] ?? 0;
                            }
                          }();
                          final gstRate = product['gst'] ?? 0;
                          final total = price * qty;
                          final gstAmount = total * (gstRate / 100);

                          final enableActions = quoteInfo == null;

                          return enableActions
                              ? Dismissible(
                                  key: ValueKey(productId),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    color: Colors.red,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  confirmDismiss: (direction) async {
                                    final confirmed =
                                        await showDeleteConfirmation(
                                          context,
                                          productId,
                                          item['id'],
                                        );
                                    if (confirmed != true) return false;
                                    return await deleteItem(
                                      productId,
                                      item['id'],
                                    );
                                  },
                                  // onDismissed: (_) {
                                  //   setState(() {
                                  //     cartItems.removeWhere(
                                  //       (item) =>
                                  //           item['Product']['id'] == productId,
                                  //     );
                                  //     selectedItemIds.remove(productId);
                                  //   });
                                  // },
                                  // deleteItem(productId, item['id']),
                                  child: CartItemCard(
                                    product: product,
                                    qty: qty,
                                    total: total,
                                    gstRate: gstRate,
                                    gstAmount: gstAmount,
                                    productId: productId,
                                    enableActions: enableActions,
                                    quoteInfo: quoteInfo,
                                    item: item,
                                    isChecked: selectedItemIds.contains(
                                      item['id'],
                                    ),
                                    onCheck: () => toggleSelect(item['id']),
                                    onDelete: () => showDeleteConfirmation(
                                      context,
                                      productId,
                                      item['id'],
                                    ),
                                    onQuantityChanged: (newQty) {
                                      // Save the new quantity in cartItems and set state for UI update
                                      setState(() {
                                        // Assign string value as your quantity is stored as string in cart
                                        cartItems[idx]['quantity'] = newQty
                                            .toString();
                                      });
                                    },
                                  ),
                                )
                              : CartItemCard(
                                  product: product,
                                  qty: qty,
                                  total: total,
                                  gstRate: gstRate,
                                  gstAmount: gstAmount,
                                  productId: productId,
                                  enableActions: enableActions,
                                  quoteInfo: quoteInfo,
                                  item: item,
                                  isChecked: false,
                                  onCheck: null,
                                  onDelete: null,
                                  onQuantityChanged: (newQty) {},
                                );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    CartSummary(
                      totalWithoutGst: totalWithoutGst,
                      totalGst: totalGst,
                      totalWithGst: totalWithGst,
                    ),
                    const SizedBox(height: 10),
                    CartQuoteButton(
                      enabled: selectedItemIds.isNotEmpty,
                      onPressed: () {
                        openQuoteSubmit(context, selectedItemIds);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
