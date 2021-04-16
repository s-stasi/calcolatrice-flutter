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
  String problemsNumber;

  @override
  _ProblemsState createState() => _ProblemsState(
      tc: tc, tas: tas, windAngle: windAngle, windVel: windVel, th: th, gs: gs);

  Problems(
      {this.problemsNumber: "null",
      var this.tc,
      var this.tas,
      var this.windAngle,
      var this.windVel,
      var this.th,
      var this.gs});
}

class _ProblemsState extends State<Problems> {
  var tas;
  var windAngle;
  var windVel;
  var th;
  var gs;
  var tc;
  late String problemNumber;

  _ProblemsState(
      {this.problemNumber: "null",
      var this.tc,
      var this.tas,
      var this.windAngle,
      var this.windVel,
      var this.th,
      var this.gs});

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
    } else {
      throw Exception('You have to choose the problem');
    }
  }

  String primoProblema() {
    num alpha;

    num wao = windAngle;
    //sfalzo il vento
    if (windAngle < 180)
      windAngle += 180;
    else
      windAngle -= 180;
    debugPrint('windAngle: $windAngle');

    // troviamo alpha
    if (windAngle < widget.tc)
      alpha = widget.tc - windAngle;
    else
      alpha = windAngle - widget.tc;
    if (alpha > 180) alpha = 360 - alpha;
    debugPrint('alpha: $alpha');

    // troviamo wca
    num wca = toDeg(Math.asin((windVel * Math.sin(toRad(alpha))) / tas));
    debugPrint('wca: $wca');

    // troviamo gamma
    num gamma = 180 - alpha - wca;
    debugPrint('gamma: $gamma');

    // troviamo gs
    num gs = (tas * Math.sin(toRad(gamma)));
    gs = gs / Math.sin(toRad(alpha));
    debugPrint('gs: $gs');

    num th;
    if (windAngle > widget.tc)
      th = widget.tc - wca;
    else if (windAngle < widget.tc)
      th = widget.tc + wca;
    else
      th = widget.tc;
    debugPrint('th: $th');

    num th1;
    if (wao > gamma)
      th1 = wao - gamma;
    else
      th1 = gamma + wao;
    debugPrint('th1: $th1');

    num th2;
    th2 = 360 - (gamma - wca);
    debugPrint('th2: $th2');

    String arr = 'gs: ${gs.toString()} th: ${th.toString()}';
    return arr;
  }

  secondoProblema() {
    num originWInd;
    num gamma;
    num wca;

//salvo la variabile vento originario
    originWInd = windAngle;

//sfalzo il vento
    if (windAngle < 180)
      windAngle += 180;
    else
      windAngle -= 180;

//trovo gamma
    if (originWInd > th)
      gamma = originWInd - th;
    else
      gamma = th - originWInd;
    if (gamma > 180) gamma = 360 - gamma;

//trovo gs
    gs = Math.sqrt(Math.pow(windVel, 2) +
        Math.pow(tas, 2) -
        (2 * windVel * tas * Math.cos(toRad(gamma))));

//trovo wca
    wca = toDeg(Math.asin((windVel * Math.sin(toRad(gamma))) / gs));

//trovo tc
    if (windAngle < th)
      tc = th + wca;
    else
      tc = th - wca;

    var arr = [tc, gs];
    return arr;
  }

  terzoProblema() {
//sfalzo il vento
    if (windAngle < 180)
      windAngle += 180;
    else
      windAngle -= 180;
  }

  quartoProblema() {
    num windVel;
    num windAngle;
    num wca;
    num alpha;
    num gamma;

    //trovo wca
    if (th > widget.tc)
      wca = th - widget.tc;
    else
      wca = widget.tc - th;

//trovo windVel
    windVel = Math.sqrt(Math.pow(tas, 2) +
        Math.pow(gs, 2) -
        (2 * tas * gs * Math.cos(toRad(wca))));

//trovo alpha
    alpha = toDeg(Math.asin((tas * Math.sin(toRad(wca))) / windVel));

//trovo gamma
    gamma = 180 - alpha - wca;

//trovo wind angle
    if (th > widget.tc)
      windAngle = th - wca - alpha;
    else
      windAngle = widget.tc - wca - alpha;

    var arr = [windAngle, windVel];
    return arr;
  }
}
