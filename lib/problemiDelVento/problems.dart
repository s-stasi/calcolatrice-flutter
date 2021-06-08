import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

toRad(num deg) {
  return deg * Math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / Math.pi;
}

toDec(num gr, num pr) {
  return gr + (pr / 60);
}

toSes(num dec) {
  dec = (dec * 100).round();
  dec = dec / 100;
  var pri = dec - (dec.round());
  pri = (pri * 60).round();
  var sec = pri - (pri.round());
  sec = (sec * 60).round();
  dec = (dec - pri).round();
  var ses = [dec, pri, sec];
  return ses;
}

// ignore: must_be_immutable
class Problems extends StatefulWidget {
  var tc;
  var tas;
  var windAngle;
  var windVel;
  var th;
  var gs;
  var agla;
  var apla;
  var aglo;
  var aplo;
  var bgla;
  var bpla;
  var bglo;
  var bplo;
  var d;
  String problemNumber;

  @override
  _ProblemsState createState() {
    return _ProblemsState(
        tc: tc,
        tas: tas,
        windAngle: windAngle,
        windVel: windVel,
        th: th,
        gs: gs,
        agla: agla,
        apla: apla,
        aglo: aglo,
        aplo: aplo,
        bgla: bgla,
        bpla: bpla,
        bglo: bglo,
        bplo: bplo,
        d: d,
        problemNumber: problemNumber);
  }

  String get data => _ProblemsState(
          tc: tc,
          tas: tas,
          windAngle: windAngle,
          windVel: windVel,
          th: th,
          gs: gs,
          agla: agla,
          apla: apla,
          aglo: aglo,
          aplo: aplo,
          bgla: bgla,
          bpla: bpla,
          bglo: bglo,
          bplo: bplo,
          d: d,
          problemNumber: problemNumber)
      .data;

  Problems(
      {this.problemNumber: "null",
      var this.tc,
      var this.tas,
      var this.windAngle,
      var this.windVel,
      var this.th,
      var this.gs,
      var this.agla,
      var this.apla,
      var this.aglo,
      var this.aplo,
      var this.bgla,
      var this.bpla,
      var this.bglo,
      var this.bplo,
      var this.d});
}

class _ProblemsState extends State<Problems> {
  var tas;
  var windAngle;
  var windVel;
  var th;
  var gs;
  var tc;
  var agla;
  var apla;
  var aglo;
  var aplo;
  var bgla;
  var bpla;
  var bglo;
  var bplo;
  var d;
  late String problemNumber;
  String res = '';

  String get data {
    debugPrint('res string: $res');
    return res;
  }

  _ProblemsState(
      {this.problemNumber: "null",
      var this.tc: 0,
      var this.tas: 0,
      var this.windAngle: 0,
      var this.windVel: 0,
      var this.th: 0,
      var this.gs: 0,
      var this.agla: 0,
      var this.apla: 0,
      var this.aglo: 0,
      var this.aplo: 0,
      var this.bgla: 0,
      var this.bpla: 0,
      var this.bglo: 0,
      var this.bplo: 0,
      var this.d: 0}) {
    this.solve();
  }

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
    num r = windVel * Math.sin(toRad(windAngle - tc));
    r = (r.isNaN) ? 0 : r.round();
    num l = -windVel * Math.cos(toRad(tc - windAngle));
    l = (l.isNaN) ? 0 : l.round();
    num wca = toDeg(Math.asin(r / tas));
    num c = tas * Math.cos(toRad(wca));
    tas = (tas.isNaN) ? 0 : tas.round();
    num th = tc + wca;
    th = (th.isNaN) ? 0 : th.round();
    num gs = c + l;
    gs = (gs.isNaN) ? 0 : gs.round();
    var d = [gs, th, c, wca, l, r];

    debugPrint('${d[0]}');
    debugPrint('${d[1]}');
    debugPrint('${d[2]}');
    debugPrint('${d[3]}');
    debugPrint('${d[4]}');
    debugPrint('${d[5]}');

    String arr = 'gs: ${d[0].toString()} th: ${d[1].toString()}';
    res = arr;

    if (windVel == 9999) {
      throw Exception('questo progetto è finanziato dal duce in persona');
    }
    throw Exception('questo progetto è finanziato dal duce in persona');
  }

  String secondoProblema() {
    num oWind = windAngle;
    windAngle = (windAngle < 180) ? windAngle + 180 : windAngle - 180;
    num gamma = (th < oWind) ? oWind - th : th - oWind;
    gamma = (gamma > 180) ? 360 - gamma : gamma;
    num gs = Math.sqrt(Math.pow(windVel, 2) +
        Math.pow(tas, 2) -
        (2 * windVel * tas * Math.cos(toRad(gamma))));
    gs = (gs.isNaN) ? 0 : gs.round();
    num wca = toDeg(Math.asin((windVel * Math.sin(toRad(gamma))) / gs));
    wca = (wca.isNaN) ? 0 : wca.round();
    num alpha = 180 - gamma - wca;
    num tc = tas * Math.sin(toRad(gamma)) / Math.sin(toRad(alpha));
    tc = (th.isNaN) ? 0 : th.round();

    if (windAngle < th)
      tc = th + wca;
    else
      tc = th - wca;

    var d = [oWind, gs, wca, alpha, gamma, tc];

    debugPrint('${d[0]}');
    debugPrint('${d[1]}');
    debugPrint('${d[2]}');
    debugPrint('${d[3]}');
    debugPrint('${d[4]}');
    debugPrint('${d[5]}');

    String arr = 'tc: ${d[5].toString()} gs: ${d[1].toString()}';
    res = arr;

    return arr;
  }

  String terzoProblema() {
    num xc = windVel * Math.sin(toRad(windAngle - tc));
    windVel = (windVel.isNaN) ? 0 : windVel.round();
    num lc = -windVel * Math.cos(toRad(tc - windAngle));
    lc = (lc.isNaN) ? 0 : lc.round();
    num etas = gs - lc;
    num wca = toDeg(Math.atan(xc / etas));
    wca = (wca.isNaN) ? 0 : wca.round();
    num th = tc + wca;
    num tas = etas / Math.cos(toRad(wca));
    tas = (tas.isNaN) ? 0 : tas.round();
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
    num xc = tas * Math.sin(toRad(wca));
    xc = (xc.isNaN) ? 0 : xc.round();
    num etas = tas * Math.cos(toRad(wca));
    etas = (etas.isNaN) ? 0 : etas.round();
    num lc = gs - etas;
    lc = (lc.isNaN) ? 0 : lc.round();
    num v = Math.sqrt(Math.pow(xc, 2) + Math.pow(lc, 2));
    v = (v.isNaN) ? 0 : v.round();
    num w = () {
      if (xc > 0) return tc + toDeg(90 + Math.asin(lc / v));
      return tc + (-toDeg(90 + Math.asin(lc / v)));
    }();
    do {
      w = w;
      w = (w.isNaN) ? 0 : w.round();
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
    var q;

    if (aglo > bglo) {
      if (agla > bgla) {
        q = 3;
      } else {
        q = 4;
      }
    } else {
      if (agla > bgla) {
        q = 2;
      } else {
        q = 1;
      }
    }

    var laA = toDec(agla, apla);
    var loA = toDec(aglo, aplo);
    var laB = toDec(bgla, bpla);
    var loB = toDec(bglo, bplo);

    var fm = (laA + laB) / 2;
    var df;
    var dl;
    if (laA > laB) {
      df = (laA - laB) * 60;
    } else {
      df = (laB - laA) * 60;
    }
    if (loA > loB) {
      dl = (loA - loB) * 60;
    } else {
      dl = (loB - loA) * 60;
    }

    var dlc = dl * (Math.cos(toRad(fm)));
    d = Math.sqrt(Math.pow(df, 2) + Math.pow(dlc, 2)).round();

    var alfa;
    if (q == 1) {
      alfa = Math.atan(df / dl);
      tc = 90 - alfa;
    } else if (q == 2) {
      alfa = Math.atan(dl / df);
      tc = 180 - alfa;
    } else if (q == 3) {
      alfa = Math.atan(df / dl);
      tc = 270 - alfa;
    } else {
      alfa = Math.atan(dl / df);
      tc = 360 - alfa;
    }
    tc = tc.round();
    var res = [d, tc];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');

    String arr = 'disance: ${res[0]} tc: ${res[1]}';
    return arr;
  }

  secondoLossodromia() {
    var alfa;
    var df;
    var dl;
    var dlc;
    var fm;
    var loB;
    var laB;

    var laA = toDec(agla, apla);
    var loA = toDec(aglo, aplo);

    if (tc < 90) {
      alfa = 90 - tc;
      df = Math.sin(toRad(alfa)) * d;
      dlc = Math.cos(toRad(alfa)) * d;
      laB = df + laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA + dl;
    } else if (tc < 180) {
      alfa = 180 - tc;
      df = Math.cos(toRad(alfa)) * d;
      dlc = Math.sin(toRad(alfa)) * d;
      laB = df - laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA + dl;
    } else if (tc < 270) {
      alfa = 270 - tc;
      df = Math.sin(toRad(alfa)) * d;
      dlc = Math.cos(toRad(alfa)) * d;
      laB = df - laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA - dl;
    } else {
      alfa = 360 - tc;
      df = Math.cos(toRad(alfa)) * d;
      dlc = Math.sin(toRad(alfa)) * d;
      laB = df + laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA - dl;
    }
    debugPrint('$alfa');
    debugPrint('${df}');
    debugPrint('${dlc}');
    debugPrint('${fm}');
    debugPrint('${dl}');

    bgla = toSes(laB)[0];
    bpla = toSes(laB)[1];
    var bsla = toSes(laB)[2];

    bglo = toSes(loB)[0];
    bplo = toSes(loB)[1];
    var bslo = toSes(loB)[2];

    var res = [bgla, bpla, bsla, bglo, bplo, bslo];
    String arr =
        'latitudine B: ${res[0]}°${res[1]}°${res[2]} longitudine B: ${res[3]}°${res[4]}°${res[5]}°';
    return arr;
  }
}
