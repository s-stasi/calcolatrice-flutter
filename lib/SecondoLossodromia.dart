import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';

class SecondoLossodromia extends StatefulWidget {
  @override
  _SLState createState() => _SLState();
}

class _SLState extends State<SecondoLossodromia> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final d = TextEditingController();
  final tc = TextEditingController();

  @override
  void dispose() {
    agla.dispose();
    apla.dispose();
    aglo.dispose();
    aplo.dispose();
    d.dispose();
    tc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    agla.addListener(_update);
    apla.addListener(_update);
    aglo.addListener(_update);
    aplo.addListener(_update);
    d.addListener(_update);
    tc.addListener(_update);
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
        d: int.tryParse(d.text) ?? 0,
        tc: int.tryParse(tc.text) ?? 0,
        problemNumber: "secondoLoss");
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'SECONDO PROBLEMA LOSSODROMIA',
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
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'GRADI',
                helperText: 'latitudine A',
              ),
            )),
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
                helperText: 'latitudine A',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            Expanded(
                child: TextField(
              controller: aglo,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'GRADI',
                helperText: 'longitudine A',
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
                helperText: 'longitudine A',
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
                labelText: 'DISTANCE',
                helperText: 'distance',
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
                helperText: 'true course',
              ),
            )),
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
                      tc: int.tryParse(tc.text) ?? 0,
                      d: int.tryParse(d.text) ?? 0,
                      problemNumber: "secondoLoss"));
            }),
        child: Text('   =   '),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
