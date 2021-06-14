import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';
import 'problems/piano_cartesiano.dart';
import 'theming/legend.dart';

class SecondoProblema extends StatefulWidget {
  @override
  _SPState createState() => _SPState();
}

class _SPState extends State<SecondoProblema> {
  final th = TextEditingController();
  final tas = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();
  var tc = '';

  @override
  void initState() {
    super.initState();
    th.addListener(_updateGraph);
    tas.addListener(_updateGraph);
    windAngle.addListener(_updateGraph);
    windVel.addListener(_updateGraph);
  }

  @override
  void dispose() {
    th.dispose();
    tas.dispose();
    windAngle.dispose();
    windVel.dispose();

    super.dispose();
  }

  _updateGraph() {
    setState(() {});
  }

  String txt() {
    return Problems(
            th: double.tryParse(th.text) ?? 0.0,
            tas: double.tryParse(tas.text) ?? 0.0,
            windAngle: double.tryParse(windAngle.text) ?? 0.0,
            windVel: double.tryParse(windVel.text) ?? 0.0,
            problemNumber: "secondo")
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'SECONDO PROBLEMA',
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
                controller: th,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'TH',
                  helperText: 'true heading',
                ),
              )),
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
              )),
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
                  helperText: 'wind angle',
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
            Text(txt(), style: TextStyle(fontSize: 25)),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.01),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.02),
            CustomPaint(
                size: Size(
                    400 < MediaQuery.of(context).size.width
                        ? 400
                        : MediaQuery.of(context).size.width - 5,
                    400 < MediaQuery.of(context).size.width
                        ? 400
                        : MediaQuery.of(context).size.width - 5),
                painter: PianoCartesianoPainter(
                    th: double.tryParse(th.text) ?? 0.0,
                    tas: double.tryParse(tas.text) ?? 0.0,
                    windAngle: double.tryParse(windAngle.text) ?? 0.0,
                    windVel: double.tryParse(windVel.text) ?? 0.0,
                    problemNumber: "secondo",
                    context: context)),
            Row(
              children: [
                Legend(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Problems(
                      th: int.tryParse(th.text) ?? 0,
                      tas: int.tryParse(tas.text) ?? 0,
                      windAngle: int.tryParse(windAngle.text) ?? 0,
                      windVel: int.tryParse(windVel.text) ?? 0,
                      problemNumber: "secondo"));
            }),
        child: Text('='),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
