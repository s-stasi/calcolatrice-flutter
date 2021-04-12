import 'package:flutter/material.dart';

class PianoCartesianoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()..color = Colors.red;
    canvas.drawRect(rect, paint);

    final paintCircle1 = Paint()..color = Colors.green..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, size.height - 80), 50, paintCircle1);
    final paintCircle2 = Paint()..color = Colors.green..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width - 150, size.height - 80), 50, paintCircle2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
