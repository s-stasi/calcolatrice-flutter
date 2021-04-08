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
                
 //              var tipe;
 //               if(value == true)tipe = Brightness.light;
 //               else tipe = Brightness.dark;

                return MaterialApp(
                  title: 'NAVTOOL',
                  theme: ThemeData(
                    brightness: Brightness.dark 
                     
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

