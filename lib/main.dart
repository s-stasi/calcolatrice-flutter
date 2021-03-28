import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      '/':(context) => MyHomePage(),
      '/PriPag':(context) => PrimoProblema(),
      '/SecPag':(context) => SecondoProblema(),
      '/TerPag':(context) => TerzoProblema(),
      '/QuaPag':(context) => QuartoProblema(),
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

class SideDrawer extends StatelessWidget {
 Iterable<int> a=[0x00B0];
 @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'MENU PROBLEMI',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('1' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.pushNamed(context,'/PriPag',),},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('2' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.pushNamed(context,'/SecPag',),},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('3' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.pushNamed(context,'/TerPag',),},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('4' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.pushNamed(context,'/QuaPag',),},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('torna menu principale'),
            onTap: () => {Navigator.pushNamed(context,'/',),},
          ),
        ],
      ),
    );
  }
}
class PrimoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('PRIMO PROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('prima pagina...'),
      ),
    );
  }
}
class SecondoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('SECONDO PROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('seconda pagina...'),
      ),
    );
  }
}
class TerzoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('TERZO PROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('terza pagina...'),
      ),
    );
  }
}
class QuartoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('QUARTO PROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('quarta pagina...'),
      ),
    );
  }
}