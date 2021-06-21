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
  String latValA = 'N';
  String latValB = 'N';
  String lonValA = 'E';
  String lonValB = 'E';

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
  void initState() {
    super.initState();
    agla.addListener(_update);
    apla.addListener(_update);
    aglo.addListener(_update);
    aplo.addListener(_update);
    bgla.addListener(_update);
    bpla.addListener(_update);
    bglo.addListener(_update);
    bplo.addListener(_update);
  }

  _update() {
    setState(() {});
  }

  String txt() {
    return Problems.priLoss(
            agla: int.tryParse(agla.text) ?? 0,
            apla: int.tryParse(apla.text) ?? 0,
            aglo: int.tryParse(aglo.text) ?? 0,
            aplo: int.tryParse(aplo.text) ?? 0,
            bgla: int.tryParse(bgla.text) ?? 0,
            bpla: int.tryParse(bpla.text) ?? 0,
            bglo: int.tryParse(bglo.text) ?? 0,
            bplo: int.tryParse(bplo.text) ?? 0)
        .data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideDrawer(),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            DropdownButton<String>(
              value: latValA,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              onChanged: (String? value) {
                setState(() {
                  latValA = value!;
                  debugPrint('latValA dropdown value $latValA');
                });
              },
              items: <String>['N', 'S']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            DropdownButton<String>(
              value: lonValA,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              onChanged: (String? value) {
                setState(() {
                  lonValA = value!;
                  debugPrint('lonValA dropdown value $lonValA');
                });
              },
              items: <String>['E', 'W']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            DropdownButton<String>(
              value: latValB,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              onChanged: (String? value) {
                setState(() {
                  latValB = value!;
                  debugPrint('latValB dropdown value $latValB');
                });
              },
              items: <String>['N', 'S']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
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
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
            DropdownButton<String>(
              value: lonValB,
              style: TextStyle(color: Colors.blue, fontSize: 20),
              onChanged: (String? value) {
                setState(() {
                  lonValB = value!;
                  debugPrint('lonValB dropdown value $lonValB');
                });
              },
              items: <String>['E', 'W']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.04, height: 150),
          ],
        ),
        Text(txt()),
      ])),
    );
  }
}
