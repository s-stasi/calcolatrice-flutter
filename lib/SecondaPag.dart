import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';
import 'problemiDelVento/piano_cartesiano.dart';
import 'package:NAVTOOL/theming/legend.dart';

class SecondoProblema extends StatefulWidget {
  @override
  _SPState createState() => _SPState();
}

class _SPState extends State<SecondoProblema> {
  final th = TextEditingController();
  final tas = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();

  @override
  void initState() {
    super.initState();
    th.addListener(_UpdateGraph);
    tas.addListener(_UpdateGraph);
    windAngle.addListener(_UpdateGraph);
    windVel.addListener(_UpdateGraph);
  }

  @override
  void dispose() {
    th.dispose();
    tas.dispose();
    windAngle.dispose();
    windVel.dispose();
    super.dispose();
  }

  _UpdateGraph() {
    setState(() {});
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
      body: Column(
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
          Problems(
              th: int.tryParse(th.text) ?? 0,
              tas: int.tryParse(tas.text) ?? 0,
              windAngle: int.tryParse(windAngle.text) ?? 0,
              windVel: int.tryParse(windVel.text) ?? 0,
              problemNumber: "secondo"),
          Container(
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.height * 0.02),
          CustomPaint(
              size: Size(400, 400),
              painter: PianoCartesianoPainter(
                  th: double.tryParse(th.text) ?? 0.0,
                  tas: double.tryParse(tas.text) ?? 0.0,
                  windAngle: double.tryParse(windAngle.text) ?? 0.0,
                  windVel: double.tryParse(windVel.text) ?? 0.0,
                  problemNumber: "secondo")),
          Legend()
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
