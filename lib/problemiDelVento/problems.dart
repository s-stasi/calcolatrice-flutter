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

  // TODO: refactor 3 problema del vento

  // var e = k(document.datapdv3)
  //                 , n = e.tgs
  //                 , t = e.th
  //                 , a = e.tc
  //                 , o = e.tas
  //                 , r = t - a
  //                 , l = I(o * Math.sin(r * Math.PI / 180))
  //                 , i = I(o * Math.cos(r * Math.PI / 180))
  //                 , c = I(n - i)
  //                 , s = I(Math.sqrt(Math.pow(l, 2) + Math.pow(c, 2)))
  //                 , u = l > 0 ? a + (90 + 180 * Math.asin(c / s) / Math.PI) : a + -(90 + 180 * Math.asin(c / s) / Math.PI)
  //                 , d = S({
  //                   xc: l,
  //                   lc: c,
  //                   wca: r,
  //                   v: s,
  //                   w: u
  //               });

  // TODO: refactor 4 problema del vento

  // var e = k(document.datapdv4)
  //                 , n = e.v
  //                 , t = e.w
  //                 , a = e.tc
  //                 , o = e.ngs
  //                 , r = I(n * Math.sin((t - a) * Math.PI / 180))
  //                 , l = I(-n * Math.cos((a - t) * Math.PI / 180))
  //                 , i = o - l
  //                 , c = 180 * Math.atan(r / i) / Math.PI
  //                 , s = a + c
  //                 , u = I(i / Math.cos(c * Math.PI / 180))
  //                 , d = S({
  //                   xc: r,
  //                   lc: l,
  //                   wca: c,
  //                   th: s,
  //                   etas: i,
  //                   tas: u
  //               });

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

  	num n = windVel;
  	num t = windAngle;
  	num a = tc;
  	num o = tas;
  	num r = n * Math.sin(toRad(t-a));
  	num l = -n * Math.cos(toRad(a-t));
  	num i = toDeg(Math.asin(r/o));
  	num c = o * Math.cos(toRad(i));
  	num s = a + i;
  	num u = c + l;
  	var d = [
  		u,
  		s,
  		c,
  		i,
  		l,
  		r
  	];

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
  	num etas = gs-lc;
  	num wca = (toDeg(Math.atan(xc/etas))).round();
  	num th = tc + wca;
  	num tas = (etas / Math.cos(toRad(wca))).round();
  	var res = [
  		xc,
  		lc,
  		wca,
  		tas,
  		etas,
  		th
  	];

  	debugPrint('${res[0]}');
  	debugPrint('${res[1]}');
  	debugPrint('${res[2]}');
  	debugPrint('${res[3]}');
  	debugPrint('${res[4]}');
  	debugPrint('${res[5]}');

    String arr = 'th: ${res[5].round()} tas: ${res[4].round()}';
    return arr;
  }

  quartoProblema() {
    num windVel;
    num windAngle;
    num wca;
    num alpha;
    num gamma;

    if (th > widget.tc)
      wca = th - widget.tc;
    else
      wca = widget.tc - th;

    windVel = Math.sqrt(Math.pow(tas, 2) +
        Math.pow(gs, 2) -
        (2 * tas * gs * Math.cos(toRad(wca))));

    alpha = toDeg(Math.asin((tas * Math.sin(toRad(wca))) / windVel));

    gamma = 180 - alpha - wca;

    if (th > widget.tc)
      windAngle = th - wca - alpha;
    else
      windAngle = widget.tc - wca - alpha;

    var arr = [windAngle, windVel];
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
