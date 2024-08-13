import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: BackgroundPainter(),
              ),
              child
            ],
          );
        },
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Левый темный треугольник
    paint.color = const Color(0xFF242C3B);
    final darkPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.55, 0)
      ..lineTo(0, size.height * 0.8)
      ..close();
    canvas.drawPath(darkPath, paint);

    // Правый синий треугольник с градиентом
    final gradientPath = Path()
      ..moveTo(size.width * 0.55, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * -0.15, size.height)
      ..close();

    const gradient = LinearGradient(
      colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    paint.shader =
        gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(gradientPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
