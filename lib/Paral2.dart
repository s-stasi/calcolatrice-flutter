import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Paral2 extends StatefulWidget {
  @override
  _P2State createState() => _P2State();
}

class _P2State extends State<Paral2> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final tc = TextEditingController();
  final d = TextEditingController();

  @override
  void dispose() {
    agla.dispose();
    apla.dispose();
    aglo.dispose();
    aplo.dispose();
    tc.dispose();
    d.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    agla.addListener(_update);
    apla.addListener(_update);
    aglo.addListener(_update);
    aplo.addListener(_update);
    tc.addListener(_update);
    d.addListener(_update);
  }

  _update() {
    setState(() {});
  }

  String txt() {
    Problems data = Problems(
        agla: int.tryParse(agla.text) ?? 0,
        apla: int.tryParse(apla.text) ?? 0,
        aglo: int.tryParse(aglo.text) ?? 0,
        aplo: int.tryParse(aplo.text) ?? 0,
        tc: int.tryParse(tc.text) ?? 0,
        d: int.tryParse(d.text) ?? 0,
        problemNumber: "NavPar2");
    return data.data;
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
                controller: tc,
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
                controller: d,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'PRIMI',
                  helperText: AppLocalizations.of(context)!.paralNavLatB,
                ),
              )),
            ],
          ),
          Text(txt()),
        ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: Problems(
                        agla: int.tryParse(agla.text) ?? 0,
                        apla: int.tryParse(apla.text) ?? 0,
                        aglo: int.tryParse(aglo.text) ?? 0,
                        aplo: int.tryParse(aplo.text) ?? 0,
                        bgla: int.tryParse(tc.text) ?? 0,
                        bpla: int.tryParse(d.text) ?? 0,
                        problemNumber: "NavPar1"));
              }),
          child: Text('   =   '),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}
