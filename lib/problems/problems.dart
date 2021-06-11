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
  String lator;
  String lonor;
  String problemNumber;
  String res = '';

  @override
  _ProblemsState createState() {
    return _ProblemsState();
  }

  String get data => res;

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
      var this.d,
      var this.lator: 'N',
      var this.lonor: 'E'});
}

class _ProblemsState extends State<Problems> {
  _ProblemsState() {
    this.solve();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.res);
  }

  void solve() {
    switch(widget.problemNumber) {
      case "primo": {primoProblema();}
      break;
      case "secondo": {secondoProblema();}
      break;
      case "terzo": {terzoProblema();}
      break;
      case "quarto": {quartoProblema();}
      break;
      case "primoLoss": {primoLossodromia();}
      break;
      case "secondoLoss": {secondoLossodromia();}
      break;
      case "NavPar1": {navParalleli1();}
      break;
      default: {throw Exception('You have to choose the problem');}
      break;
    }
  }

  void primoProblema() {
    num r = widget.windVel * Math.sin(toRad(widget.windAngle - widget.tc));
    r = (r.isNaN) ? 0 : r.round();
    num l = -widget.windVel * Math.cos(toRad(widget.tc - widget.windAngle));
    l = (l.isNaN) ? 0 : l.round();
    num wca = toDeg(Math.asin(r / widget.tas));
    num c = widget.tas * Math.cos(toRad(wca));
    widget.tas = (widget.tas.isNaN) ? 0 : widget.tas.round();
    num th = widget.tc + wca;
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

    if (widget.windVel == 9999) {
      arr =
          "Questo progetto è stato finanziato interamente dal regime fascista italiano";
    }

    widget.res = arr;
  }

  void secondoProblema() {
    num oWind = widget.windAngle;
    widget.windAngle = (widget.windAngle < 180)
        ? widget.windAngle + 180
        : widget.windAngle - 180;
    num gamma = (widget.th < oWind) ? oWind - widget.th : widget.th - oWind;
    gamma = (gamma > 180) ? 360 - gamma : gamma;
    num gs = Math.sqrt(Math.pow(widget.windVel, 2) +
        Math.pow(widget.tas, 2) -
        (2 * widget.windVel * widget.tas * Math.cos(toRad(gamma))));
    gs = (gs.isNaN) ? 0 : gs.round();
    num wca = toDeg(Math.asin((widget.windVel * Math.sin(toRad(gamma))) / gs));
    wca = (wca.isNaN) ? 0 : wca.round();
    num alpha = 180 - gamma - wca;
    num tc = widget.tas * Math.sin(toRad(gamma)) / Math.sin(toRad(alpha));
    tc = (widget.th.isNaN) ? 0 : widget.th.round();

    if (widget.windAngle < widget.th)
      tc = widget.th + wca;
    else
      tc = widget.th - wca;

    var d = [oWind, gs, wca, alpha, gamma, tc];

    debugPrint('${d[0]}');
    debugPrint('${d[1]}');
    debugPrint('${d[2]}');
    debugPrint('${d[3]}');
    debugPrint('${d[4]}');
    debugPrint('${d[5]}');

    String arr = 'tc: ${d[5].toString()} gs: ${d[1].toString()}';
    widget.res = arr;
  }

  void terzoProblema() {
    num xc = widget.windVel * Math.sin(toRad(widget.windAngle - widget.tc));
    widget.windVel = (widget.windVel.isNaN) ? 0 : widget.windVel.round();
    num lc = -widget.windVel * Math.cos(toRad(widget.tc - widget.windAngle));
    lc = (lc.isNaN) ? 0 : lc.round();
    num etas = widget.gs - lc;
    num wca = toDeg(Math.atan(xc / etas));
    wca = (wca.isNaN) ? 0 : wca.round();
    num th = widget.tc + wca;
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
    widget.res = arr;
  }

  void quartoProblema() {
    num wca = widget.th - widget.tc;
    if (wca < 0) wca = wca * -1;
    num xc = widget.tas * Math.sin(toRad(wca));
    xc = (xc.isNaN) ? 0 : xc.round();
    num etas = widget.tas * Math.cos(toRad(wca));
    etas = (etas.isNaN) ? 0 : etas.round();
    num lc = widget.gs - etas;
    lc = (lc.isNaN) ? 0 : lc.round();
    num v = Math.sqrt(Math.pow(xc, 2) + Math.pow(lc, 2));
    v = (v.isNaN) ? 0 : v.round();
    num w = () {
      if (xc > 0) return widget.tc + toDeg(90 + Math.asin(lc / v));
      return widget.tc + (-toDeg(90 + Math.asin(lc / v)));
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
    widget.res = arr;
  }

  void primoLossodromia() {
    var q;

    if (widget.aglo > widget.bglo) {
      if (widget.agla > widget.bgla) {
        q = 3;
      } else {
        q = 4;
      }
    } else {
      if (widget.agla > widget.bgla) {
        q = 2;
      } else {
        q = 1;
      }
    }

    var laA = toDec(widget.agla, widget.apla);
    var loA = toDec(widget.aglo, widget.aplo);
    var laB = toDec(widget.bgla, widget.bpla);
    var loB = toDec(widget.bglo, widget.bplo);

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
    widget.d = Math.sqrt(Math.pow(df, 2) + Math.pow(dlc, 2));
    widget.d = (widget.d.isNaN) ? 0 : widget.d.round();

    var alfa;
    if (q == 1) {
      alfa = Math.atan(df / dl);
      widget.tc = 90 - alfa;
    } else if (q == 2) {
      alfa = Math.atan(dl / df);
      widget.tc = 180 - alfa;
    } else if (q == 3) {
      alfa = Math.atan(df / dl);
      widget.tc = 270 - alfa;
    } else {
      alfa = Math.atan(dl / df);
      widget.tc = 360 - alfa;
    }
    widget.tc = (widget.tc.isNaN) ? 0 : widget.tc.round();
    var res = [widget.d, widget.tc];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');

    String arr = 'disance: ${res[0]} tc: ${res[1]}';
    widget.res = arr;
  }

  void secondoLossodromia() {
    var alfa;
    var df;
    var dl;
    var dlc;
    var fm;
    var loB;
    var laB;

    var laA = toDec(widget.agla, widget.apla);
    var loA = toDec(widget.aglo, widget.aplo);

    if (widget.tc < 90) {
      alfa = 90 - widget.tc;
      df = Math.sin(toRad(alfa)) * widget.d;
      dlc = Math.cos(toRad(alfa)) * widget.d;
      laB = df + laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA + dl;
    } else if (widget.tc < 180) {
      alfa = 180 - widget.tc;
      df = Math.cos(toRad(alfa)) * widget.d;
      dlc = Math.sin(toRad(alfa)) * widget.d;
      laB = df - laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA + dl;
    } else if (widget.tc < 270) {
      alfa = 270 - widget.tc;
      df = Math.sin(toRad(alfa)) * widget.d;
      dlc = Math.cos(toRad(alfa)) * widget.d;
      laB = df - laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA - dl;
    } else {
      alfa = 360 - widget.tc;
      df = Math.cos(toRad(alfa)) * widget.d;
      dlc = Math.sin(toRad(alfa)) * widget.d;
      laB = df + laA;
      fm = (laA + laB) / 2;
      dl = (dlc) / Math.cos(toRad(fm));
      loB = loA - dl;
    }
    debugPrint('$alfa');
    debugPrint('$df');
    debugPrint('$dlc');
    debugPrint('$fm');
    debugPrint('$dl');
    widget.bgla = toSes(laB)[0];
    widget.bpla = toSes(laB)[1];
    var bsla = toSes(laB)[2];

    widget.bglo = toSes(loB)[0];
    widget.bplo = toSes(loB)[1];
    var bslo = toSes(loB)[2];

    var res = [widget.bgla, widget.bpla, bsla, widget.bglo, widget.bplo, bslo];
    String arr =
        'latitudine B: ${res[0]}°${res[1]}\'${res[2]}\" longitudine B: ${res[3]}°${res[4]}\'${res[5]}\"';
    widget.res = arr;
  }

  void navParalleli1() {}
}
