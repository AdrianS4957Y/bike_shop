import 'package:bike_shop/cart/cart_list.dart';
import 'package:bike_shop/cart/shipping_qualify.dart';
import 'package:bike_shop/globals/custom_title.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  double totalPrice = 6119.99;
  getTotalPrice(double price) {
    setState(() {
      totalPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242C3B),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            const CustomTitle(),
            const SizedBox(
              height: 16,
            ),
            CartList(
              getTotalPrice: getTotalPrice,
            ),
            ShippingQualify(
              totalPrice: totalPrice,
              discount: 30,
            ),
          ],
        ),
      ),
    );
  }
}
