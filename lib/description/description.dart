import 'package:bike_shop/description/background.dart';
import 'package:bike_shop/description/description_body.dart';
import 'package:bike_shop/globals/classes/bike.dart';
import 'package:bike_shop/globals/custom_title.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final Bike bike;
  const Description({
    super.key,
    required this.bike,
  });

  @override
  DescriptionState createState() => DescriptionState();
}

class DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const CustomTitle(),
          const SizedBox(
            height: 27,
          ),
          Image.asset(
            widget.bike.src,
            height: 222,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 41,
          ),
          DescriptionBody(
            bike: widget.bike,
          ),
        ],
      ),
    ));
  }
}
