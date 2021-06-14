import 'package:flutter/material.dart';
import 'dart:math' as Math;

toRad(num deg) {
  return deg * Math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / Math.pi;
}

double offCheck(double offset, Size size) {
  double off = size.height / 2;
  if (offset.isNaN) return off;
  if (offset.isInfinite) return off;
  return offset;
}

class PianoCartesianoPainter extends CustomPainter {
  double th;
  double tc;
  double gs;
  double tas;
  double windVel;
  double windAngle;
  String problemNumber;
  BuildContext context;

  PianoCartesianoPainter(
      {this.problemNumber: "null",
      this.tc: 0.0,
      this.tas: 0.0,
      this.windAngle: 0.0,
      this.windVel: 0.0,
      this.th: 0.0,
      this.gs: 0.0,
      required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    double gridScale = (size.height * 0.05).round().toDouble();
    List<dynamic> verticalArray = [];
    List<dynamic> horizontalArray = [];

    for (var i = 0; i <= 1; i++) {
      for (var i = 0; i <= 20; i++) {
        var paintLine = Paint()
          ..color = Colors.green
          ..strokeWidth = 0.5;
        i == 0 ? verticalArray.add(paintLine) : horizontalArray.add(paintLine);
      }
    }

    for (dynamic j in verticalArray) {
      for (double i = 0; i <= 20; i++) {
        canvas.drawLine(
          Offset((size.height / 20) * i, 0),
          Offset((size.height / 20) * i, size.height),
          j,
        );
      }
    }

    for (dynamic j in horizontalArray) {
      for (double i = 0; i <= 20; i++) {
        canvas.drawLine(
          Offset(0, (size.width / 20) * i),
          Offset(size.width, (size.width / 20) * i),
          j,
        );
      }
    }

    var midHor = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      midHor,
    );

    var midVer = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(size.height / 2, 0),
      Offset(size.height / 2, size.height),
      midVer,
    );

    double w = windAngle + 180;
    double mult = 0;

    switch (problemNumber) {
      case 'primo':
        {
          double r = windVel * Math.sin(toRad(w - tc));
          double l = -windVel * Math.cos(toRad(tc - w));
          double i = toDeg(Math.asin(r / tas));
          double c = tas * Math.cos(toRad(i));
          var gs = c + l;
          mult = 1 / (gs / (size.height / 2));
          debugPrint('mult: $mult');
          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(
                offCheck(size.height / 2 + gs * mult * Math.cos(toRad(tc - 90)),
                    size),
                offCheck(size.height / 2 + gs * mult * Math.sin(toRad(tc - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
          ];

          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(
                offCheck(
                    size.height / 2 + windVel * mult * Math.cos(toRad(w - 90)),
                    size),
                offCheck(
                    size.height / 2 + windVel * mult * Math.sin(toRad(w - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
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
          mult = 1 / (tas / (size.height / 2));
          debugPrint('mult: $mult');
          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(
                offCheck(
                    size.height / 2 + windVel * mult * Math.cos(toRad(w - 90)),
                    size),
                offCheck(
                    size.height / 2 + windVel * mult * Math.sin(toRad(w - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [
            Offset(
                offCheck(
                    size.height / 2 + tas * mult * Math.cos(toRad(th - 90)),
                    size),
                offCheck(
                    size.height / 2 + tas * mult * Math.sin(toRad(th - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
          ];

          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [windCoord[0], tasCoord[0]];

          var MPScale = 400 > size.height ? 1 / (40 / (size.height / 10)) : 1;
          var MPPaint = Paint()
            ..color = Colors.blue
            ..strokeWidth = 4;
          var MPXCoord = [
            Offset(windCoord[0].dx - 40 * MPScale, windCoord[0].dy),
            Offset(windCoord[0].dx + 40 * MPScale, windCoord[0].dy)
          ];
          var MPYCoord = [
            Offset(windCoord[0].dx, windCoord[0].dy - 40 * MPScale),
            Offset(windCoord[0].dx, windCoord[0].dy + 40 * MPScale)
          ];

          canvas.drawLine(MPXCoord[0], MPXCoord[1], MPPaint);
          canvas.drawLine(MPYCoord[0], MPYCoord[1], MPPaint);
          canvas.drawLine(gsCoord[0], gsCoord[1], gsPaint);
          canvas.drawLine(windCoord[0], windCoord[1], windPaint);
          canvas.drawLine(tasCoord[0], tasCoord[1], tasPaint);
          break;
        }
      case 'terzo':
        {
          mult = 1 / (gs / (size.height / 2));
          debugPrint('mult: $mult');
          var windPaint = Paint()
            ..color = Colors.yellow
            ..strokeWidth = 4;
          var windCoord = [
            Offset(
                offCheck(
                    size.height / 2 + windVel * mult * Math.cos(toRad(w - 90)),
                    size),
                offCheck(
                    size.height / 2 + windVel * mult * Math.sin(toRad(w - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
          ];

          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(
                offCheck(size.height / 2 + gs * mult * Math.cos(toRad(tc - 90)),
                    size),
                offCheck(size.height / 2 + gs * mult * Math.sin(toRad(tc - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
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
          if (tas > gs) {
            mult = 1 / (tas / (size.height / 2));
            debugPrint('mult: $mult');
          } else {
            mult = 1 / (gs / (size.height / 2));
            debugPrint('mult: $mult');
          }

          var gsPaint = Paint()
            ..color = Colors.red
            ..strokeWidth = 4;
          var gsCoord = [
            Offset(
                offCheck(size.height / 2 + gs * mult * Math.cos(toRad(tc - 90)),
                    size),
                offCheck(size.height / 2 + gs * mult * Math.sin(toRad(tc - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
          ];

          var tasPaint = Paint()
            ..color = Colors.black
            ..strokeWidth = 4;
          var tasCoord = [
            Offset(
                offCheck(
                    size.height / 2 + tas * mult * Math.cos(toRad(th - 90)),
                    size),
                offCheck(
                    size.height / 2 + tas * mult * Math.sin(toRad(th - 90)),
                    size)),
            Offset(size.height / 2, size.height / 2)
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
