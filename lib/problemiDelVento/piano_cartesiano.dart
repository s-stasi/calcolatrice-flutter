import 'package:flutter/material.dart';
import 'dart:math' as Math;

toRad(num deg) {
  return deg * Math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / Math.pi;
}

class PianoCartesianoPainter extends CustomPainter {
  double th;
  double tc;
  double gs;
  double tas;
  double windVel;
  double windAngle;
  String problemNumber;

  PianoCartesianoPainter(
      {this.problemNumber: "null",
      this.tc: 0.0,
      this.tas: 0.0,
      this.windAngle: 0.0,
      this.windVel: 0.0,
      this.th: 0.0,
      this.gs: 0.0});

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

    double w = windAngle + 180;
    double max = 266.66666;
    double mult = (gs >= max) ? max / (gs * 1.34) : max / (gs * 1.34);
    if (gs == 0) {
      mult = 1;
    }

    debugPrint('mult: ${mult}');

    switch (problemNumber) {
      case 'primo':
        {
          double r = windVel * Math.sin(toRad(w - tc));
          double l = -windVel * Math.cos(toRad(tc - w));
          double i = toDeg(Math.asin(r / tas));
          double c = tas * Math.cos(toRad(i));
          var gs = c + l;
          mult = (gs >= max) ? max / (gs * 1.34) : max / (gs * 1.34);
          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(200 + gs * mult * Math.cos(toRad(tc - 90)),
                200 + gs * mult * Math.sin(toRad(tc - 90))),
            Offset(200, 200)
          ];

          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(200 + windVel * mult * Math.cos(toRad(w - 90)),
                200 + windVel * mult * Math.sin(toRad(w - 90))),
            Offset(200, 200)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [windCoord[0], gsCoord[0]];

          /// Drawing everything
          canvas.drawLine(gsCoord[0], gsCoord[1], gsPaint);
          canvas.drawLine(windCoord[0], windCoord[1], windPaint);
          canvas.drawLine(tasCoord[0], tasCoord[1], tasPaint);

          break;
        }
      case 'secondo':
        {
          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(200 + windVel * mult * Math.cos(toRad(w - 90)),
                200 + windVel * mult * Math.sin(toRad(w - 90))),
            Offset(200, 200)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [
            Offset(200 + tas * mult * Math.cos(toRad(th - 90)),
                200 + tas * mult * Math.sin(toRad(th - 90))),
            Offset(200, 200)
          ];

          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [windCoord[0], tasCoord[0]];

          var MPPaint = Paint()
            ..color = Colors.blue
            ..strokeWidth = 4;
          var MPXCoord = [
            Offset(windCoord[0].dx - 40, windCoord[0].dy),
            Offset(windCoord[0].dx + 40, windCoord[0].dy)
          ];
          var MPYCoord = [
            Offset(windCoord[0].dx, windCoord[0].dy - 40),
            Offset(windCoord[0].dx, windCoord[0].dy + 40)
          ];

          debugPrint('mpxpainter[0]:  ${MPXCoord[0]}');
          debugPrint('mpxpainter[1]:  ${MPXCoord[1]}');

          canvas.drawLine(MPXCoord[0], MPXCoord[1], MPPaint);
          canvas.drawLine(MPYCoord[0], MPYCoord[1], MPPaint);
          canvas.drawLine(gsCoord[0], gsCoord[1], gsPaint);
          canvas.drawLine(windCoord[0], windCoord[1], windPaint);
          canvas.drawLine(tasCoord[0], tasCoord[1], tasPaint);
          break;
        }
      case 'terzo':
        {
          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(200 + windVel * mult * Math.cos(toRad(w - 90)),
                200 + windVel * mult * Math.sin(toRad(w - 90))),
            Offset(200, 200)
          ];

          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(200 + gs * mult * Math.cos(toRad(tc - 90)),
                200 + gs * mult * Math.sin(toRad(tc - 90))),
            Offset(200, 200)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [windCoord[0], gsCoord[0]];

          /// Drawing everything
          canvas.drawLine(gsCoord[0], gsCoord[1], gsPaint);
          canvas.drawLine(windCoord[0], windCoord[1], windPaint);
          canvas.drawLine(tasCoord[0], tasCoord[1], tasPaint);

          break;
        }
      case 'quarto':
        {
          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(200 + gs * mult * Math.cos(toRad(tc - 90)),
                200 + gs * mult * Math.sin(toRad(tc - 90))),
            Offset(200, 200)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [
            Offset(200 + tas * mult * Math.cos(toRad(th - 90)),
                200 + tas * mult * Math.sin(toRad(th - 90))),
            Offset(200, 200)
          ];

          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [tasCoord[0], gsCoord[0]];

          /// Drawing everything
          canvas.drawLine(gsCoord[0], gsCoord[1], gsPaint);
          canvas.drawLine(windCoord[0], windCoord[1], windPaint);
          canvas.drawLine(tasCoord[0], tasCoord[1], tasPaint);

          break;
        }
      default:
        {
          throw Exception('Choose the problem number');
        }
    }

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
