import 'package:bike_shop/cart/bike_widget.dart';
import 'package:bike_shop/globals/classes/bike.dart';
import 'package:bike_shop/globals/database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartList extends StatefulWidget {
  Function getTotalPrice;
  CartList({super.key, required this.getTotalPrice});

  @override
  CartListState createState() => CartListState();
}

class CartListState extends State<CartList> {
  Map<String, BikeCounter> cart = {};
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: bikeList.map(
          (Map<String, dynamic> object) {
            cart[object["name"]] = BikeCounter(
                price: double.parse(object["price"].toString()), count: 1);
            cart.forEach((String name, BikeCounter counter) {
              totalPrice += counter.totalPrice;
            });
            return BikeWidget(
              bike: Bike(
                object["image"],
                object["name"],
                object["price"],
                description: object["description"],
                specification: object["specification"],
              ),
              setCount: (String name, int count) {
                if (cart[name] == null) {
                  cart[name] = BikeCounter(price: object["price"]);
                } else {
                  cart[name]!.count = count;
                }
                totalPrice = 0;
                cart.forEach((String name, BikeCounter counter) {
                  totalPrice += counter.totalPrice;
                });
                widget.getTotalPrice(totalPrice);
              },
            );
          },
        ).toList(),
      ),
    ));
  }
}

class BikeCounter {
  late int count;
  late double price;
  BikeCounter({required this.price, count}) {
    this.count = count ?? 0;
  }
  get totalPrice {
    return count * price;
  }
}
