import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
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
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
              title: 'NAVTOOL',
              theme: theme.getTheme(),
              routes: {
                '/': (context) => MyHomePage(),
                '/PriPag': (context) => PrimoProblema(),
                '/SecPag': (context) => SecondoProblema(),
                '/TerPag': (context) => TerzoProblema(),
                '/QuaPag': (context) => QuartoProblema(),
                '/ImpPag': (context) => Impostazioni(),
              },
            ));
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
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
          backgroundColor: Colors.blue[900],
          drawer: SideDrawer(),
          appBar: AppBar(
            title: Text('IMPOSTAZIONI'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black,
                Colors.grey,
              ])),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () => {
                          print('set light theme'),
                          theme.setLightMode(),
                        },
                    child: Text('set light theme')),
                TextButton(
                    onPressed: () => {
                          print('set dark theme'),
                          theme.setDarkMode(),
                        },
                    child: Text('set dark theme')),
              ],
            ),
          )),
    );
  }
}
