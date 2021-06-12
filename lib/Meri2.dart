import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Meri2 extends StatefulWidget {
  @override
  _M2State createState() => _M2State();
}

class _M2State extends State<Meri2> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final bgla = TextEditingController();
  final bpla = TextEditingController();
  final bglo = TextEditingController();
  final bplo = TextEditingController();
  final tc = TextEditingController();
  final d = TextEditingController();
  String dirA = 'N';
  String dirB = 'N';

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
    bgla.addListener(_update);
    bpla.addListener(_update);
    bglo.addListener(_update);
    bplo.addListener(_update);
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
        bgla: int.tryParse(bgla.text) ?? 0,
        bpla: int.tryParse(bpla.text) ?? 0,
        bglo: int.tryParse(bglo.text) ?? 0,
        bplo: int.tryParse(bplo.text) ?? 0,
        problemNumber: "NavMer2");
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
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              DropdownButton<String>(
                value: dirA,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                onChanged: (String? value) {
                  setState(() {
                    dirA = value!;
                  });
                },
                items: <String>['N', 'S']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: null,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                  child: TextField(
                controller: d,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'DISTANCE',
                  helperText: AppLocalizations.of(context)!.distance,
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              DropdownButton<String>(
                value: dirB,
                style: TextStyle(color: Colors.blue, fontSize: 20),
                onChanged: (String? value) {
                  setState(() {
                    dirB = value!;
                  });
                },
                items: <String>['N', 'S']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: null,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                        bgla: int.tryParse(bgla.text) ?? 0,
                        bpla: int.tryParse(bpla.text) ?? 0,
                        bglo: int.tryParse(bglo.text) ?? 0,
                        bplo: int.tryParse(bplo.text) ?? 0,
                        d: int.tryParse(d.text) ?? 0,
                        problemNumber: "NavMer2"));
              }),
          child: Text('   =   '),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}
