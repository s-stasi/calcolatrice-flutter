//import 'SideDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'problems.dart';
import 'settings.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final giuseppe = TextEditingController();
  final mario = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    giuseppe.dispose();
    mario.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dividerHeight = MediaQuery.of(context).size.height * 0.3;
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
            if (i == 0)
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => Problems(),
                  transitionDuration: Duration(seconds: 0),
                ),
                (route) => false,
              );
            //  if (i == 1) Navigator.pushNamed(context, '/');
            if (i == 2)
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => Impostazioni(),
                  transitionDuration: Duration(seconds: 0),
                ),
                (route) => false,
              );
          },
        ),
        backgroundColor: Color.fromARGB(196, 32, 64, 96),
        //drawer: SideDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'conversione nodi / Km/h',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: 150),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      //controller: ,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue.shade900, width: 3.0)),
                          labelText:
                              'nodi', //AppLocalizations.of(context)!.paralNavDegree,
                          helperText:
                              'nodi' //AppLocalizations.of(context)!.paralNavLatA,
                          ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: 150),
                  Icon(
                    Icons.compare_arrows,
                    size: 38,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: 150),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      //controller: ,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.shade900, width: 3.0)),
                        labelText:
                            'km/h', //AppLocalizations.of(context)!.paralNavDegree,
                        helperText:
                            'km/h', //AppLocalizations.of(context)!.paralNavLatA,
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.04,
                      height: 150),
                ],
              )
            ],
          ),
        ));
  }
}
