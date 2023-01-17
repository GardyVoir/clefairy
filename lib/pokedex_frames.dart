import 'package:flutter/material.dart';

class TopFrame extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(201, 45, 54, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 50);
    path.lineTo(size.width * 0.75, 50);
    path.lineTo(size.width, 140);
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BottomFrame extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(201, 45, 54, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.25, 90);
    path.lineTo(size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path.shift(const Offset(0, -10)), Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
