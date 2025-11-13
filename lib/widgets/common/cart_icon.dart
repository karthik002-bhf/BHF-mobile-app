import 'package:bhf_mobile_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int cartItemCount; // Pass this value while using CartIcon

  const CartIcon({super.key, required this.cartItemCount});

  void openCart(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 16,
      child: GestureDetector(
        onTap: () => openCart(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 137, 200, 201),
            borderRadius: BorderRadius.circular(44),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromARGB(255, 79, 78, 78),
                size: 40,
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: -10,
                  top: -10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 147, 57, 221),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      cartItemCount > 99 ? '99+' : '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
