import 'package:flutter/material.dart';
import 'dart:math' as math;

toRad(num deg) {
  return deg * math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / math.pi;
}

class PianoCartesianoPainter extends CustomPainter {
  double th;
  double tc;
  double gs;
  double tas;
  double windVel;
  double windAngle;

  PianoCartesianoPainter(
      this.th, this.tc, this.gs, this.tas, this.windVel, this.windAngle);

  @override
  void paint(Canvas canvas, Size size) {
    List<dynamic> verticalArray = [];
    for (var i = 0; i <= 400; i++) {
      if (i % 20 == 0) {
        var paintLine = Paint()
          ..color = Colors.green
          ..strokeWidth = 0.5;
        verticalArray.add(paintLine);
      }
    }

    for (dynamic j in verticalArray) {
      for (double i = 0; i <= 400; i++) {
        if (i % 20 == 0) {
          canvas.drawLine(
            Offset(i, 0),
            Offset(i, size.height),
            j,
          );
        }
      }
    }

    List<dynamic> horizontalArray = [];
    for (var i = 0; i <= 400; i++) {
      if (i % 20 == 0) {
        var paintLine = Paint()
          ..color = Colors.green
          ..strokeWidth = 0.5;
        horizontalArray.add(paintLine);
      }
    }

    for (dynamic j in horizontalArray) {
      for (double i = 0; i <= 400; i++) {
        if (i % 20 == 0) {
          canvas.drawLine(
            Offset(0, i),
            Offset(size.width, i),
            j,
          );
        }
      }
    }

    var midHor = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(0, 200),
      Offset(size.width, 200),
      midHor,
    );

    var midVer = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(200, 0),
      Offset(200, size.height),
      midVer,
    );

    var gsCoordinates = [Offset(0, 0), Offset(0, 0)];

    gsCoordinates = [
      Offset(
          200 + gs * math.cos(toRad(tc)), 200 - 1 * gs * math.sin(toRad(tc))),
      Offset(200, 200)
    ];

    var tcPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;

    canvas.drawLine(gsCoordinates[0], gsCoordinates[1], tcPaint);

    /*final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()..color = Colors.red;
    canvas.drawRect(rect, paint);

    final paintCircle1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, size.height - 80), 50, paintCircle1);
    final paintCircle2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width - 150, size.height - 80), 50, paintCircle2);*/
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
