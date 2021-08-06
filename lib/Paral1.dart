import 'package:flutter/material.dart';
//import 'problems/problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Paral1 extends StatefulWidget {
  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<Paral1> {
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final bglo = TextEditingController();
  final bplo = TextEditingController();
  final gla = TextEditingController();
  final pla = TextEditingController();
  final tc = TextEditingController();
  final d = TextEditingController();

  bool correction = false;

  @override
  void dispose() {
    aglo.dispose();
    aplo.dispose();
    bglo.dispose();
    bplo.dispose();
    gla.dispose();
    pla.dispose();
    tc.dispose();
    d.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    aglo.addListener(_update);
    aplo.addListener(_update);
    bglo.addListener(_update);
    bplo.addListener(_update);
    gla.addListener(_update);
    pla.addListener(_update);
    tc.addListener(_update);
    d.addListener(_update);
  }

  _update() {
    setState(() {});
  }

  String txt() {
    return 'implement this';
    /*Problems.priPar(
        aglo: int.tryParse(aglo.text) ?? 0,
        aplo: int.tryParse(aplo.text) ?? 0,
        bglo: int.tryParse(bglo.text) ?? 0,
        bplo: int.tryParse(bplo.text) ?? 0,
        gla: int.tryParse(gla.text) ?? 0,
        pla: int.tryParse(pla.text) ?? 0,
        tc: int.tryParse(tc.text) ?? 0,
        d: tryParse(d.text) ?? 0
        )
      .data;*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.paralNavTitle,
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
          'inserire i valori W come negativi e E come positivi ',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: aglo,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: AppLocalizations.of(context)!.paralNavDegree,
                  helperText: AppLocalizations.of(context)!.paralNavLonA,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: aplo,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'PRIMI',
                  helperText: AppLocalizations.of(context)!.paralNavLonA,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: bglo,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: AppLocalizations.of(context)!.paralNavDegree,
                helperText: AppLocalizations.of(context)!.paralNavLonB,
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: bplo,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'PRIMI',
                helperText: AppLocalizations.of(context)!.paralNavLonB,
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
              keyboardType: TextInputType.number,
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
              keyboardType: TextInputType.number,
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
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: gla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'OPTIONAL',
                helperText: 'latitude degree',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: pla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'OPTIONAL',
                helperText: 'latitude first',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
          ],
        ),
      ])),
    );
  }
}
