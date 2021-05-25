import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problems/problems.dart';

class PrimoLossodromia extends StatefulWidget {
  @override
  _PLState createState() => _PLState();
}

class _PLState extends State<PrimoLossodromia> {
  final agla = TextEditingController();
  final apla = TextEditingController();
  final aglo = TextEditingController();
  final aplo = TextEditingController();
  final bgla = TextEditingController();
  final bpla = TextEditingController();
  final bglo = TextEditingController();
  final bplo = TextEditingController();

  @override
  void dispose() {
    agla.dispose();
    apla.dispose();
    aglo.dispose();
    aplo.dispose();
    bgla.dispose();
    bpla.dispose();
    bglo.dispose();
    bplo.dispose();
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
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
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
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
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
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
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
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
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
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
                child: TextField(
              controller: bgla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'GRADI',
                helperText: 'latitudine B ',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
                child: TextField(
              controller: bpla,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'PRIMI',
                helperText: 'latitudine B ',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
                child: TextField(
              controller: bglo,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'GRADI',
                helperText: 'longitudine B',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
            Expanded(
                child: TextField(
              controller: bplo,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 3.0)),
                labelText: 'PRIMI',
                helperText: 'longitudine B',
              ),
            )),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.20),
          ],
        )
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
                      bgla: int.tryParse(bgla.text) ?? 0,
                      bpla: int.tryParse(bpla.text) ?? 0,
                      bglo: int.tryParse(bglo.text) ?? 0,
                      bplo: int.tryParse(bplo.text) ?? 0,
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
