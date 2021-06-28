import 'SideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
      bottomNavigationBar: ConvexAppBar(
        activeColor: Colors.blue[900],
        items: [
          TabItem(icon: Icons.menu_open, title: 'Problems'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.settings, title: 'Settings'),
        ],
        initialActiveIndex: 1, //optional, default as 0
        onTap: (int i) {
          if (i == 0) Navigator.pushNamed(context, '/Problems');
          //  if (i == 1) Navigator.pushNamed(context, '/');
          if (i == 2) Navigator.pushNamed(context, '/ImpPag');
        },
      ),
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      //drawer: SideDrawer(),
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
