import 'package:NAVTOOL/theming/legend.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'problems/piano_cartesiano.dart';

class PrimoProblema extends StatefulWidget {
  @override
  _PPState createState() => _PPState();
}

class _PPState extends State<PrimoProblema> {
  final tc = TextEditingController();
  final tas = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();
  var _gs = '';
  var _th = '';

  @override
  void initState() {
    super.initState();
    tc.addListener(_updateGraph);
    tas.addListener(_updateGraph);
    windAngle.addListener(_updateGraph);
    windVel.addListener(_updateGraph);
  }

  @override
  void dispose() {
    tc.dispose();
    tas.dispose();
    windAngle.dispose();
    windVel.dispose();
    super.dispose();
  }

  _updateGraph() {
    setState(() {});
  }

  String txt() {
    Problems data = Problems(
        tc: double.tryParse(tc.text) ?? 0.0,
        tas: double.tryParse(tas.text) ?? 0.0,
        windAngle: double.tryParse(windAngle.text) ?? 0.0,
        windVel: double.tryParse(windVel.text) ?? 0.0,
        problemNumber: "primo");
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'PRIMO PROBLEMA',
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
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                child: TextField(
                  controller: tc,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
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
                  controller: tas,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
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
                controller: windAngle,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'WIND ANGLE',
                  helperText: 'WInd angle',
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                  child: TextField(
                controller: windVel,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'WIND SPEED',
                  helperText: 'wind speed',
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
            ]),
            Text(txt()),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.02),
            CustomPaint(
                size: Size(400, 400),
                painter: PianoCartesianoPainter(
                    tc: double.tryParse(tc.text) ?? 0.0,
                    tas: double.tryParse(tas.text) ?? 0.0,
                    windAngle: double.tryParse(windAngle.text) ?? 0.0,
                    windVel: double.tryParse(windVel.text) ?? 0.0,
                    problemNumber: "primo")),
            Row(
              children: [
                Legend(),
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text('fanculo la scuola'));
            }),
        child: Text('='),
      ),
    );
  }
}
