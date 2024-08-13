import 'package:bike_shop/description/description.dart';
import 'package:bike_shop/globals/classes/bike.dart';
import 'package:bike_shop/globals/colors.dart';
import 'package:bike_shop/globals/fonts.dart';
import 'package:flutter/material.dart';

class BikeWidget extends StatefulWidget {
  final Bike bike;
  final Function setCount;
  const BikeWidget({
    super.key,
    required this.bike,
    required this.setCount,
  });

  @override
  BikeWidgetState createState() => BikeWidgetState();
}

const bikesImgBgGradient = LinearGradient(
  colors: [
    Color(0xFF363E51),
    Color(0xFF4C5770),
  ],
);

class BikeWidgetState extends State<BikeWidget> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        width: double.infinity, // Занять всю ширину экрана
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Color.fromARGB(128, 0xFF, 0xFF, 0xFF),
            width: 0.5,
          )),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Description(
                    bike: widget.bike,
                  ),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SizedBox(
              height: 90,
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 100,
                    decoration: const BoxDecoration(
                      gradient: bikesImgBgGradient,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ), //Color.lerp(Color(0xFF363E51), Color(0xFF4C5770), 1),
                    child: Image.asset(
                      widget.bike.src,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    // Расширить до доступного пространства
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bike.name,
                          style: poppins(fontSize: 15),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.bike.formattedPrice,
                              style: poppins(fontSize: 13, color: lightBlue),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF242C3B),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFF242c3b),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 4), // Смещение тени
                                  ),
                                ],
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF242C3B),
                                    Color(0xFF1B2330),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.1),
                                  width: 0.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Кнопка +
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _count += 1;
                                        widget.setCount(
                                            widget.bike.name, _count);
                                      });
                                    },
                                    child: Container(
                                      height: 24,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.shade300,
                                            Colors.blue.shade900,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '$_count',
                                    style:
                                        poppins(color: const Color(0x99FFFFFF)),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (_count > 0) {
                                        setState(() {
                                          _count -= 1;
                                          widget.setCount(
                                              widget.bike.name, _count);
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: minusButtonColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
