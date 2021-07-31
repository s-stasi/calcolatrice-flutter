//import 'SideDrawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'problems.dart';
import 'problems/conversions.dart';
import 'settings.dart';
import 'reversable_conversion.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: [
            ReversableConversion(
              title: 'conversione nodi / Km/h',
              functions: [ntk, ktn],
              first: 'nodi',
              second: 'km/h',
            ),
          ],
        ),
      ),
    );
  }
}
