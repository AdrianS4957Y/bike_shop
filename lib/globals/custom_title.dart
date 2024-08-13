import 'package:bike_shop/globals/fonts.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatefulWidget {
  const CustomTitle({
    super.key,
  });

  @override
  CustomTitleState createState() => CustomTitleState();
}

class CustomTitleState extends State<CustomTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Image.asset("assets/left.png"),
              onPressed: () {
                if (Navigator.canPop(context)) Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            height: 44,
            child: Center(
              child: Text(
                "My Shopping Cart",
                style: poppins(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
