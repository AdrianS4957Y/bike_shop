import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  SliderWidgetState createState() => SliderWidgetState();
}

class SliderWidgetState extends State<SliderWidget> {
  double offset = 0.0;
  bool isCompleted = false;

  void onDragUpdate(DragUpdateDetails details) {
    setState(() {
      offset = details.localPosition.dx
          .clamp(0.0, MediaQuery.of(context).size.width * 0.45 - 44);
    });
  }

  void onDragEnd(DragEndDetails details) {
    if (offset > MediaQuery.of(context).size.width * 0.45 - 88) {
      setState(() {
        isCompleted = true;
        offset = MediaQuery.of(context).size.width * 0.45 - 44;
      });
    } else {
      setState(() {
        offset = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFF2C2F3F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              left: offset,
              child: GestureDetector(
                onPanUpdate: onDragUpdate,
                onPanEnd: onDragEnd,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF34C8E8),
                        Color(0xFF4E4AF2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 44), // Половина ширины слайдера
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
