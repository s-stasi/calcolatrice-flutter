import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Problems extends StatefulWidget {
  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          activeColor: Colors.blue[50],
          items: [
            TabItem(icon: Icons.menu_open, title: 'Problems'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: (int i) {
            // if (i == 0) Navigator.pushNamed(context, '/Problems');
            if (i == 1) Navigator.pushNamed(context, '/');
            if (i == 2) Navigator.pushNamed(context, '/ImpPag');
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Problems',
            style: TextStyle(color: Colors.white),
          ),
          //iconTheme: IconThemeData(color: Colors.red),
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
            ExpansionTile(
              title: Text(
                AppLocalizations.of(context)!.wpTitle,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        )));
  }
}
