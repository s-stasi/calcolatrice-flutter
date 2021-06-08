import 'theming/legend.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'problems/piano_cartesiano.dart';

class QuartoProblema extends StatefulWidget {
  @override
  _QPState createState() => _QPState();
}

class _QPState extends State<QuartoProblema> {
  final th = TextEditingController();
  final tas = TextEditingController();
  final tc = TextEditingController();
  final gs = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc.addListener(_updateGraph);
    gs.addListener(_updateGraph);
    th.addListener(_updateGraph);
    tas.addListener(_updateGraph);
  }

  @override
  void dispose() {
    th.dispose();
    tas.dispose();
    tc.dispose();
    gs.dispose();
    super.dispose();
  }

  _updateGraph() {
    setState(() {});
  }

  String txt() {
    Problems data = Problems(
        tc: double.tryParse(th.text) ?? 0.0,
        tas: double.tryParse(tas.text) ?? 0.0,
        gs: double.tryParse(gs.text) ?? 0.0,
        th: double.tryParse(th.text) ?? 0.0,
        problemNumber: "primo");
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'QUARTO PROBLEMA',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
              child: TextField(
                controller: th,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'TH',
                  helperText: 'true heading',
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
              child: TextField(
                controller: tas,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'TAS',
                  helperText: 'true air speed',
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
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
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
              child: TextField(
                controller: gs,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'GS',
                  helperText: 'ground speed',
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
          ]),
          CustomPaint(
              size: Size(400, 400),
              painter: PianoCartesianoPainter(
                  tc: double.tryParse(tc.text) ?? 0.0,
                  gs: double.tryParse(gs.text) ?? 0.0,
                  th: double.tryParse(th.text) ?? 0.0,
                  tas: double.tryParse(tas.text) ?? 0.0,
                  problemNumber: "quarto")),
          Row(
            children: [
              Legend(),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Problems(
                      tc: int.tryParse(tc.text) ?? 0,
                      tas: int.tryParse(tas.text) ?? 0,
                      th: int.tryParse(th.text) ?? 0,
                      gs: int.tryParse(gs.text) ?? 0,
                      problemNumber: "quarto"));
            }),
        child: Text('   =   '),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
