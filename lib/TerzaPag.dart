import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';
import 'problemiDelVento/piano_cartesiano.dart';

class TerzoProblema extends StatefulWidget {
  @override
  _PTState createState() => _PTState();
}

class _PTState extends State<TerzoProblema> {
  final tc = TextEditingController();
  final gs = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc.addListener(_UpdateGraph);
    gs.addListener(_UpdateGraph);
    windAngle.addListener(_UpdateGraph);
    windVel.addListener(_UpdateGraph);
  }

  @override
  void dispose() {
    tc.dispose();
    gs.dispose();
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
          'TERZO PROBLEMA',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.blue])),
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
          ),
        ),
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
                      windAngle: double.tryParse(windAngle.text) ?? 0.0,
                      windVel: double.tryParse(windVel.text) ?? 0.0,
                      problemNumber: "terzo")),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Problems(
                      tc: int.tryParse(tc.text) ?? 0,
                      gs: int.tryParse(gs.text) ?? 0,
                      windAngle: int.tryParse(windAngle.text) ?? 0,
                      windVel: int.tryParse(windVel.text) ?? 0,
                      problemNumber: "terzo"));
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
