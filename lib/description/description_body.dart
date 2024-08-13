import 'package:bike_shop/globals/classes/bike.dart';
import 'package:bike_shop/globals/fonts.dart';
import 'package:flutter/material.dart';

class DescriptionBody extends StatefulWidget {
  final Bike bike;
  const DescriptionBody({super.key, required this.bike});

  @override
  DescriptionBodyState createState() => DescriptionBodyState();
}

final activeTextStyle = poppins(
    fontSize: 15, fontWeight: FontWeight.bold, color: const Color(0xFF3CA4EB));
final notActiveTextStyle = poppins(fontSize: 15);

class DescriptionBodyState extends State<DescriptionBody> {
  bool isDescriptionActive = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF353F54), Color(0xFF222834)],
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isDescriptionActive = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(isDescriptionActive
                      ? const Color(0xFF323B4F)
                      : const Color(0xFF28303F)),
                  shadowColor: const WidgetStatePropertyAll(
                    Color(0xFF38445A),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Description",
                    style: isDescriptionActive
                        ? activeTextStyle
                        : notActiveTextStyle,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isDescriptionActive = false;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(!isDescriptionActive
                      ? const Color(0xFF323B4F)
                      : const Color(0xFF28303F)),
                  shadowColor: const WidgetStatePropertyAll(
                    Color(0xFF38445A),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Specification",
                    style: !isDescriptionActive
                        ? activeTextStyle
                        : notActiveTextStyle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.bike.name,
                        style:
                            poppins(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Text(
                      isDescriptionActive
                          ? widget.bike.description
                          : widget.bike.specification,
                      style: poppins(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(
                      0xFF1C222E,
                    ),
                    blurRadius: 40,
                    offset: Offset.fromDirection(
                      BorderSide.strokeAlignInside,
                      -10,
                    )),
              ],
              color: const Color(0xFF262E3D),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            height: 104,
            padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${widget.bike.price}",
                  style: poppins(
                    fontSize: 24,
                    color: const Color(0xFF3D9CEA),
                  ),
                ),
                FittedBox(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFF34C8E8),
                              Color(0xFF4E4AF2),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 38),
                        child: Text(
                          "Add to Cart",
                          style: poppins(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
