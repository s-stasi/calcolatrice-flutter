import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';

class SecondoLossodromia extends StatefulWidget {
  @override
  _SLState createState() => _SLState();
}

class _SLState extends State<SecondoLossodromia> {
  final aF = TextEditingController();
  final aL = TextEditingController();
  final d = TextEditingController();
  final tc = TextEditingController();

  @override
  void dispose() {
    aF.dispose();
    aL.dispose();
    d.dispose();
    tc.dispose();
    super.dispose();
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
      body: Row(children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
            child: TextField(
          controller: aF,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3.0)),
            labelText: 'φA',
            helperText: 'latitudine A',
          ),
        )),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
            child: TextField(
          controller: aL,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3.0)),
            labelText: 'λA',
            helperText: 'longitudine A',
          ),
        )),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
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
        )),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Problems(
                      aF: int.tryParse(aF.text) ?? 0,
                      aL: int.tryParse(aL.text) ?? 0,
                      bF: int.tryParse(d.text) ?? 0,
                      bL: int.tryParse(tc.text) ?? 0,
                      problemNumber: "secondoLoss"));
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
