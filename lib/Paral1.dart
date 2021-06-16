import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Paral1 extends StatefulWidget {
  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<Paral1> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final bgla = TextEditingController();
  final bpla = TextEditingController();
  final bglo = TextEditingController();
  final bplo = TextEditingController();

  @override
  void dispose() {
    agla.dispose();
    apla.dispose();
    aglo.dispose();
    aplo.dispose();
    bgla.dispose();
    bpla.dispose();
    bglo.dispose();
    bplo.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    agla.addListener(_update);
    apla.addListener(_update);
    aglo.addListener(_update);
    aplo.addListener(_update);
    bgla.addListener(_update);
    bpla.addListener(_update);
    bglo.addListener(_update);
    bplo.addListener(_update);
  }

  _update() {
    setState(() {});
  }

  String txt() {
    return 'implement this';/*Problems.priPar(
        agla: int.tryParse(agla.text) ?? 0,
        apla: int.tryParse(apla.text) ?? 0,
        aglo: int.tryParse(aglo.text) ?? 0,
        aplo: int.tryParse(aplo.text) ?? 0,
        bgla: int.tryParse(bgla.text) ?? 0,
        bpla: int.tryParse(bpla.text) ?? 0,
        bglo: int.tryParse(bglo.text) ?? 0,
        bplo: int.tryParse(bplo.text) ?? 0)
      .data;*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
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
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                child: TextField(
                  controller: agla,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
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
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'PRIMI',
                    helperText: AppLocalizations.of(context)!.paralNavLatA,
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                  child: TextField(
                controller: aglo,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: AppLocalizations.of(context)!.paralNavDegree,
                  helperText: AppLocalizations.of(context)!.paralNavLonA,
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                  child: TextField(
                controller: aplo,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'PRIMI',
                  helperText: AppLocalizations.of(context)!.paralNavLonA,
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
                controller: bgla,
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
              Expanded(
                  child: TextField(
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
          Text(txt()),
        ])),);
  }
}
