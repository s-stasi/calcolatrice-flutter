import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';

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
  void dispose() {
    tc.dispose();
    gs.dispose();
    windAngle.dispose();
    windVel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('TERZO PROBLEMA'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue
              ]
            )
          ),
        ), 
      ),
      body: Row(
        children: <Widget>[
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
            controller: gs,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 3.0)),
              labelText: 'GS',
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
              labelText: 'WIND VELOCITY',
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Text('gs: ' +
                      terzoProblema(
                              int.parse(tc.text),
                              int.parse(gs.text),
                              int.parse(windAngle.text),
                              int.parse(windVel.text))[0]
                          .toString() +
                      ' th: ' +
                      terzoProblema(                                       
                              int.parse(tc.text),
                              int.parse(gs.text),
                              int.parse(windAngle.text),
                              int.parse(windVel.text))[1]
                          .toString()));
              }
            ),
        child: Text('   =   '),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
