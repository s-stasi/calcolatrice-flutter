import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';
import 'problemiDelVento/piano_cartesiano.dart';

class PrimoProblema extends StatefulWidget {
  @override
  _PPState createState() => _PPState();
}

class _PPState extends State<PrimoProblema> {
  final tc = TextEditingController();
  final tas = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();

  @override
  void dispose() {
    tc.dispose();
    tas.dispose();
    windAngle.dispose();
    windVel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('PRIMO PROBLEMA'),
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
                controller: tc,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'TC',
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
                labelText: 'WIND VELOCITY',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
          ]),
          CustomPaint(
            size: Size(400, 400),
            painter: PianoCartesianoPainter(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Text('gs: ' +
                      primoProblema(
                              int.parse(tc.text),
                              int.parse(tas.text),
                              int.parse(windAngle.text),
                              int.parse(windVel.text))[0]
                          .toString() +
                      ' th: ' +
                      primoProblema(
                              int.parse(tc.text),
                              int.parse(tas.text),
                              int.parse(windAngle.text),
                              int.parse(windVel.text))[1]
                          .toString()));
            }),
        child: Text('   =   '),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
