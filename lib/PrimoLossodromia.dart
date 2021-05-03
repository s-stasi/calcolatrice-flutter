import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';

class PrimoLossodromia extends StatefulWidget {
  @override
  _PLState createState() => _PLState();
}

class _PLState extends State<PrimoLossodromia> {
  final aF = TextEditingController();
  final bF = TextEditingController();
  final aL = TextEditingController();
  final bL = TextEditingController();

  @override
  void dispose() {
    aF.dispose();
    bF.dispose();
    aL.dispose();
    bL.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'PRIMO PROBLEMA LOSSODROMIA',
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
          controller: bF,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3.0)),
            labelText: 'φB',
            helperText: 'latitudine B',
          ),
        )),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
            child: TextField(
          controller: bL,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3.0)),
            labelText: 'λB',
            helperText: 'longitudine B',
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
                      bF: int.tryParse(bF.text) ?? 0,
                      bL: int.tryParse(bL.text) ?? 0,
                      problemNumber: "primoLoss"));
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
