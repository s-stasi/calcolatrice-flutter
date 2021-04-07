import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'PrimaPag.dart';
import 'SecondaPag.dart';
import 'TerzaPag.dart';
import 'QuartaPag.dart';
import 'Impostazioni.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        var themeData = null;
        var themeData1 = ThemeData(
                     brightness: Brightness.dark
                      );
        var themeData2 = ThemeData(
                     brightness: Brightness.dark
                      );
                return MaterialApp(
                  title: 'NAVTOOL',
                  theme: ThemeData(
                    if(value = true)brightness: Brightness.light 
                    else 
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

