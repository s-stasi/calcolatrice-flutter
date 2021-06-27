import 'package:flutter/material.dart';
import 'problems/problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Meri1 extends StatefulWidget {
  @override
  _M1State createState() => _M1State();
}

class _M1State extends State<Meri1> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final bgla = TextEditingController();
  final bpla = TextEditingController();
  final glo = TextEditingController();
  final plo = TextEditingController();
  final tc = TextEditingController();
  final d = TextEditingController();

  @override
  void dispose() {
    agla.dispose();
    apla.dispose();
    bgla.dispose();
    bpla.dispose();
    glo.dispose();
    plo.dispose();
    tc.dispose();
    d.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    agla.addListener(_update);
    apla.addListener(_update);
    bgla.addListener(_update);
    bpla.addListener(_update);
    glo.addListener(_update);
    plo.addListener(_update);
    tc.addListener(_update);
    d.addListener(_update);
  }

  _update() {
    setState(() {});
  }

  String txt() {
    return Problems.priMer(
            agla: int.tryParse(agla.text) ?? 0,
            apla: int.tryParse(apla.text) ?? 0,
            bgla: int.tryParse(bgla.text) ?? 0,
            bpla: int.tryParse(bpla.text) ?? 0,
            bglo: int.tryParse(glo.text) ?? 0,
            bplo: int.tryParse(plo.text) ?? 0,
            tc: int.tryParse(tc.text) ?? 0,
            d: int.tryParse(d.text) ?? 0)
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.meridNavTitle,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Text(
          'inserire i valori S come negativi e N come positivi ',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
              child: TextField(
                controller: agla,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: AppLocalizations.of(context)!.paralNavDegree,
                  helperText: AppLocalizations.of(context)!.paralNavLatA,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
              child: TextField(
                controller: apla,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'PRIMI',
                  helperText: AppLocalizations.of(context)!.paralNavLatA,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              controller: bgla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: AppLocalizations.of(context)!.paralNavDegree,
                helperText: AppLocalizations.of(context)!.paralNavLatB,
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              controller: bpla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'PRIMI',
                helperText: AppLocalizations.of(context)!.paralNavLatB,
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              controller: d,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'distance',
                helperText: AppLocalizations.of(context)!.distance,
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              controller: tc,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'TC',
                helperText: 'True Course',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
          ],
        ),
        Text(txt()),
      ])),
    );
  }
}
