import 'package:bike_shop/cart/slider_widget.dart';
import 'package:bike_shop/globals/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShippingQualify extends StatefulWidget {
  double totalPrice;
  double discount;
  ShippingQualify({
    super.key,
    required this.totalPrice,
    required this.discount,
  });

  @override
  ShippingQualifyState createState() => ShippingQualifyState();
}

class ShippingQualifyState extends State<ShippingQualify> {
  @override
  Widget build(BuildContext context) {
    return
        //  FittedBox(
        //   clipBehavior: Clip.none,
        //   alignment: Alignment.center,
        //   fit: BoxFit.fitHeight,
        //   child:
        Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 352,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Your cart qualifies for free shipping",
                  style: poppins(fontSize: 15),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Bike30",
                hintStyle: poppins(
                  fontSize: 13,
                  color: const Color(0x98FFFFFF),
                ),
                fillColor: const Color(0xFF232a38),
                filled: true,
                suffixIconConstraints: const BoxConstraints(maxHeight: 48),
                suffixIcon: MaterialButton(
                  onPressed: () {},
                  splashColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF34C8E8),
                            Color(0xFF4E4AF2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 12),
                    child: Text(
                      "Apply",
                      style: poppins(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: poppins(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "\$${widget.totalPrice.toStringAsFixed(2)}",
                  style: poppins(color: const Color(0x98FFFFFF), fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fee:",
                  style: poppins(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "\$0",
                  style: poppins(color: const Color(0x98FFFFFF), fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount:",
                  style: poppins(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "${widget.discount}%",
                  style: poppins(color: const Color(0x98FFFFFF), fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: poppins(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "\$${((100 - widget.discount) * widget.totalPrice / 100).toStringAsFixed(2)}",
                  style: poppins(
                    color: const Color(0xFF38B8EA),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SliderWidget()
          ],
        ),
      ),
      // ),
    );
  }
}
