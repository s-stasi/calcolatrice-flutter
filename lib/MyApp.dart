import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'PrimaPag.dart';
import 'SecondaPag.dart';
import 'TerzaPag.dart';
import 'QuartaPag.dart';
import 'SideDrawer.dart';
import 'MyHomePage.dart';
var modalita;

class MyApp extends StatefulWidget {
     @override
    _MAState createState() => _MAState(); 
}

class _MAState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
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

class Impostazioni extends StatefulWidget {
  @override 
  ImpostazioniState createState() => ImpostazioniState();
}

class ImpostazioniState extends State<Impostazioni> {

  bool status = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('IMPOSTAZIONI'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue,
              ]
            )
          ),
        ), 
      ),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              value: status,
              onChanged: (value) {
                if(value == true) modalita = 'light mode';
                else modalita = 'dark mode';
                setState(() {
                  status = value;
                });
              },
            ),
            SizedBox(height: 12.0,),
            Text('modalità : $modalita', style: TextStyle(
              color: Colors.black,
              fontSize: 20.0
            ),
           )
          ],
        ),
      )
    );
  }
}
