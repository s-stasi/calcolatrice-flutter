import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SalitaCalc {
  static final num qne = 1013.25;
  String _res = '';
  num qnh;
  int flightLevel;
  num t0;
  num elev;
  num vs;
  num gs;
  num ff;

  SalitaCalc(
      {required this.qnh,
      required this.flightLevel,
      required this.t0,
      required this.elev,
      required this.vs,
      required this.gs,
      required this.ff}) {
    num x = qnh - qne * 27;
    debugPrint('x= $x');
    num ia = (flightLevel * 100) - x;
    debugPrint('ia= $ia');
    num tisa = 15 - 2 * flightLevel / 1000;
    debugPrint('tisa= $tisa');
    num deltaT = t0 - tisa;
    deltaT = (deltaT < 0) ? -deltaT : deltaT;
    debugPrint('deltaT= $deltaT');
    num ta = ia + ((4 / 1000) * ia * deltaT);
    ta = (ta.isNaN) ? 0 : ta.round();
    debugPrint('ta= $ta');
    num ht = ta - elev;
    debugPrint('ht= $ht');
    num fttoc = (ht / vs) / 60;
    debugPrint('fttoc= $fttoc');
    num d = gs * fttoc;
    debugPrint('d= $d');
    num c = ff * fttoc;
    debugPrint('c= $c');
    _res = 'ta: $ta ft, fttoc: $fttoc h, distance: $d NM, consumo: $c USG';
  }

  String get result {
    return _res;
  }
}

class SalitaPainter extends CustomPainter {
  static final double qne = 1013.25;
  double qnh;

  SalitaPainter({required this.qnh});

  @override
  void paint(Canvas canvas, Size size) {
    var qnePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;
    var qneCoord = [Offset(0, 400 - 400 / 5), Offset(400, 400 - 400 / 5)];
    var path = Path();
    var paint = Paint();

    var w = size.width;
    var h = size.height;

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    path.addRect(rect);

    path.moveTo(0, 50);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    paint = new Paint()..color = Colors.grey.shade600;

    var apPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    var apCoord = [
      Offset(20, 400 * 0.6),
      Offset(45, 400 * 0.6)
    ];

    var qnhPaint = paint()
      ..color = Colors.blue.shade400
      ..strokeWidth = 4;
    var qnhHeight = (qnh > qne) ? 400 - 400 / 5 + 10 : 400 - 400 / 5 - 10;
    var qnhCoord = [
      Offset(0, qnhHeight),
      Offset(400, qnhHeight)
    ];

    var flPaint = Paint()
      ..color = Colors.yellow
      ..strokeLine = 4
    var flCoord0 = [
      Offset(0, 400/7),
      Offset(400/7, 400/7)
    ];
    var flCoord1 = [
      Offset((400/7) *2, 400/7),
      Offset((400/7) * 3, 400/7)
    ];
    var flCoord2 = [
      Offset((400/7) *4, 400/7),
      Offset((400/7) * 5, 400/7)
    ];
    var flCoord3 = [
      Offset((400/7) *6, 400/7),
      Offset((400/7) * 7, 400/7)
    ];

    canvas.drawPath(path, paint);
    canvas.drawLine(flCoord1[0], flCoord1[1], flPaint);
    canvas.drawLine(flCoord2[0], flCoord2[1], flPaint);
    canvas.drawLine(flCoord3[0], flCoord3[1], flPaint);
    canvas.drawLine(flCoord4[0], flCoord4[1], flPaint);
    canvas.drawLine(qnhCoord[0], qnhCoord[1], qnhPaint);                                                   
    canvas.drawLine(apCoord[0], apCoord[1], apPaint);
    canvas.drawLine(qneCoord[0], qneCoord[1], qnePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
