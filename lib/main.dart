import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'PrimaPag.dart';
import 'SideDrawer.dart';
import 'SecondaPag.dart';
import 'TerzaPag.dart';
import 'QuartaPag.dart';
import 'Impostazioni.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAVTOOL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/PriPag': (context) => PrimoProblema(),
        '/SecPag': (context) => SecondoProblema(),
        '/TerPag': (context) => TerzoProblema(),
        '/QuaPag': (context) => QuartoProblema(),
        '/ImpPag': (context) => Impostazioni(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('NAVIGATION TOOL'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('in arrivo...'),
      ),
    );
  }
}
