import 'SideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'HOME PAGE',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
      ),
      body: Column(children: <Widget>[
        Center(
          child: Text(
            'NAVTOOL',
            style: TextStyle(
              fontSize: 85,
            ),
          ),
        ),
      ]),
    );
  }
}
