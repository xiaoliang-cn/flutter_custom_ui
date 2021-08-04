import 'package:flutter/material.dart';

///simple draw a line
///简单的绘制一条直线,可用于电商显示价格失效的内容
class XLDrawLine extends CustomPainter {
  final Color? lineColor;
  final double strokeWidth;
  XLDrawLine({this.lineColor, this.strokeWidth = 4.0});
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        Paint()
          ..color = lineColor ?? Colors.grey
          ..strokeWidth = strokeWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
