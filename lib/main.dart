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
      '/SecondaPagina':(context) => SecondaPagina(),
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
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('1' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.pushNamed(context,'/SecondaPagina',),},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('2' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('3' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text('4' + String.fromCharCodes(a) + ' problema del vento'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('torna menu principale'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
class SecondaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('PRIMO BROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('seconda pagina...'),
      ),
    );
  }
}