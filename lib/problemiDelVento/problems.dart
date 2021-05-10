import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

toRad(num deg) {
  return deg * Math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / Math.pi;
}

class Problems extends StatefulWidget {
  var tc;
  var tas;
  var windAngle;
  var windVel;
  var th;
  var gs;
  var aF;
  var aL;
  var bF;
  var bL;
  var d;
  String problemNumber;

  @override
  _ProblemsState createState() => _ProblemsState(
      tc: tc,
      tas: tas,
      windAngle: windAngle,
      windVel: windVel,
      th: th,
      gs: gs,
      aF: aF,
      aL: aL,
      bF: bF,
      bL: bL,
      d: d,
      problemNumber: problemNumber);

  Problems(
      {this.problemNumber: "null",
      var this.tc,
      var this.tas,
      var this.windAngle,
      var this.windVel,
      var this.th,
      var this.gs,
      var this.aF,
      var this.aL,
      var this.bF,
      var this.bL,
      var this.d});
}

class _ProblemsState extends State<Problems> {
  var tas;
  var windAngle;
  var windVel;
  var th;
  var gs;
  var tc;
  var aF;
  var aL;
  var bF;
  var bL;
  var d;
  late String problemNumber;

  _ProblemsState(
      {this.problemNumber: "null",
      var this.tc,
      var this.tas,
      var this.windAngle,
      var this.windVel,
      var this.th,
      var this.gs,
      var this.aF,
      var this.aL,
      var this.bF,
      var this.bL,
      var this.d});

  @override
  Widget build(BuildContext context) {
    return Text(this.solve());
  }

  String solve() {
    if (this.problemNumber == "primo") {
      return primoProblema();
    } else if (this.problemNumber == "secondo") {
      return secondoProblema();
    } else if (this.problemNumber == "terzo") {
      return terzoProblema();
    } else if (this.problemNumber == "quarto") {
      return quartoProblema();
    } else if (this.problemNumber == "primoLoss") {
      return primoLossodromia();
    } else if (this.problemNumber == "secondoLoss") {
      return secondoLossodromia();
    } else {
      throw Exception('You have to choose the problem');
    }
  }

  String primoProblema() {
    num r = (windVel * Math.sin(toRad(windAngle - tc))).round();
    num l = (-windVel * Math.cos(toRad(tc - windAngle))).round();
    num wca = (toDeg(Math.asin(r / tas)));
    num c = (tas * Math.cos(toRad(wca))).round();
    num th = (tc + wca).round();
    num gs = (c + l).round();
    var d = [gs, th, c, wca, l, r];

    debugPrint('${d[0]}');
    debugPrint('${d[1]}');
    debugPrint('${d[2]}');
    debugPrint('${d[3]}');
    debugPrint('${d[4]}');
    debugPrint('${d[5]}');

    String arr = 'gs: ${d[0].round()} th: ${d[1].round()}';
    return arr;
  }

  secondoProblema() {
    num originWInd;
    num gamma;
    num wca;
    originWInd = windAngle;

    if (windAngle < 180)
      windAngle += 180;
    else
      windAngle -= 180;

    if (originWInd > th)
      gamma = originWInd - th;
    else
      gamma = th - originWInd;
    if (gamma > 180) gamma = 360 - gamma;

    gs = Math.sqrt(Math.pow(windVel, 2) +
        Math.pow(tas, 2) -
        (2 * windVel * tas * Math.cos(toRad(gamma))));

    wca = toDeg(Math.asin((windVel * Math.sin(toRad(gamma))) / gs));

    if (windAngle < th)
      tc = th + wca;
    else
      tc = th - wca;

    var arr = [tc, gs];
    return arr;
  }

  String terzoProblema() {
    num xc = (windVel * Math.sin(toRad(windAngle - tc))).round();
    num lc = (-windVel * Math.cos(toRad(tc - windAngle))).round();
    num etas = gs - lc;
    num wca = (toDeg(Math.atan(xc / etas))).round();
    num th = tc + wca;
    num tas = (etas / Math.cos(toRad(wca))).round();
    var res = [xc, lc, wca, tas, etas, th];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');
    debugPrint('${res[2]}');
    debugPrint('${res[3]}');
    debugPrint('${res[4]}');
    debugPrint('${res[5]}');

    String arr = 'th: ${res[5].round()} tas: ${res[4].round()}';
    return arr;
  }

  String quartoProblema() {
    num wca = th - tc;
    if (wca < 0) wca = wca * -1;
    num xc = (tas * Math.sin(toRad(wca))).round();
    num etas = (tas * Math.cos(toRad(wca))).round();
    num lc = (gs - etas).round();
    num v = (Math.sqrt(Math.pow(xc, 2) + Math.pow(lc, 2))).round();
    num w = () {
      if (xc > 0) return tc + toDeg(90 + Math.asin(lc / v));
      return tc + (-toDeg(90 + Math.asin(lc / v)));
    }();
    do {
      w = w.round();
      w = w - 360;
    } while (w > 360);
    var res = [xc, lc, wca, v, w];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');
    debugPrint('${res[2]}');
    debugPrint('${res[3]}');
    debugPrint('${res[4]}');

    String arr = 'v: ${res[3]} w: ${res[4]}';
    return arr;
  }

  primoLossodromia() {
    var delF;
    if (aF > bF)
      delF = aF - bF;
    else
      delF = bF - aF;
  }

  secondoLossodromia() {}
}
