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
  if (gr > 0) {
    return gr + (pr / 60);
  } else {
    gr = gr * -1;
    return (gr + (pr / 60)) * -1;
  }
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
  String problemNumber = 'nann';
  String res = 'nann';

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
      lator: lator,
      lonor: lonor,
      problemNumber: problemNumber,
    );
  }

  String get data => createState().data;

  Problems({
    this.problemNumber: "nann",
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
    var this.lonor: 'E',
  });
}

class _ProblemsState extends State<Problems> {
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
  String problemNumber = 'nann';
  String res = 'nann';

  _ProblemsState({
    this.problemNumber: "nann",
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
    var this.lonor: 'E',
  }) {
    this.solve();
  }

  get data => res;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    solve();
    return Text(res);
  }

  void solve() {
    switch (problemNumber) {
      case "primo":
        {
          primoProblema();
        }
        break;
      case "secondo":
        {
          secondoProblema();
        }
        break;
      case "terzo":
        {
          terzoProblema();
        }
        break;
      case "quarto":
        {
          quartoProblema();
        }
        break;
      case "primoLoss":
        {
          primoLossodromia();
        }
        break;
      case "secondoLoss":
        {
          secondoLossodromia();
        }
        break;
      case "NavPar1":
        {
          navParalleli1();
        }
        break;
      case "NavMer1":
        {
          navMeridiani1();
        }
        break;
      default:
        {
          throw Exception('You have to choose the problem');
        }
    }
  }

  void primoProblema() {
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

    if (windVel == 9999) {
      arr =
          "Questo progetto è stato finanziato interamente dal regime fascista italiano";
    }

    res = arr;
    print('aaaa: ${res}');
  }

  void secondoProblema() {
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
  }

  void terzoProblema() {
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
    this.res = arr;
  }

  void quartoProblema() {
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
    w = w == -360 ? 0 : w;
    var res = [xc, lc, wca, v, w];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');
    debugPrint('${res[2]}');
    debugPrint('${res[3]}');
    debugPrint('${res[4]}');

    String arr = 'v: ${res[3]} w: ${res[4]}';
    this.res = arr;
  }

  void primoLossodromia() {
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
    d = Math.sqrt(Math.pow(df, 2) + Math.pow(dlc, 2));
    d = (d.isNaN) ? 0 : d.round();

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
    tc = (tc.isNaN) ? 0 : tc.round();
    var res = [d, tc];

    debugPrint('${res[0]}');
    debugPrint('${res[1]}');

    String arr = 'disance: ${res[0]} tc: ${res[1]}';
    this.res = arr;
  }

  void secondoLossodromia() {
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
    debugPrint('$df');
    debugPrint('$dlc');
    debugPrint('$fm');
    debugPrint('$dl');
    bgla = toSes(laB)[0];
    bpla = toSes(laB)[1];
    var bsla = toSes(laB)[2];

    bglo = toSes(loB)[0];
    bplo = toSes(loB)[1];
    var bslo = toSes(loB)[2];

    var res = [bgla, bpla, bsla, bglo, bplo, bslo];
    String arr =
        'latitudine B: ${res[0]}°${res[1]}\'${res[2]}\" longitudine B: ${res[3]}°${res[4]}\'${res[5]}\"';
    this.res = arr;
  }

  void navParalleli1() {
    this.res = 'r';
  }

  void navMeridiani1() {
    if (d == 0) {
      var ala = toDec(agla, apla);
      var bla = toDec(bgla, bpla);
      var dg = ala - bla;
      if (dg < 0) dg = dg * -1;
      d = dg * 60;
      if (ala > bla)
        tc = 180;
      else
        tc = 0;
      var res = [d, tc];
      String arr = 'distance: ${res[0]}kt  tc: ${res[1]}°';
      this.res = arr;
    } else {
      var ala = toDec(agla, apla);
      var dg = d / 60;
      var bla;
      if (tc == 0 || tc == 360)
        bla = ala + dg;
      else
        bla = ala - dg;
      bgla = toSes(bla)[0];
      bpla = toSes(bla)[1];
      var res = [bgla, bpla];
      if (tc != 0 || tc != 360 || tc != 180)
        var arr = 'inserisci un  allore valido (0/360 & 180) ';
      String arr = "B: ${res[0]}° ${res[1]}'";
      this.res = arr;
    }
  }
}
