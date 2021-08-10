import 'package:flutter/material.dart';

class XLCirler extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path()
      ..addOval(Rect.fromCircle(center: Offset.zero, radius: 30));
    canvas.drawPath(path, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
