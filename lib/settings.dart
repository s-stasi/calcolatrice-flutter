import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'SideDrawer.dart';

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
              drawer: SideDrawer(),
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.gayyy,
                  style: TextStyle(color: Colors.black),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.grey,
                    Colors.white,
                  ])),
                ),
              ),
              body: Container(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 5),
                        Text('Grafica'),
                      ],
                    ),
                    Divider(height: 15, thickness: 3),
                  ],
                ),
              ),
            ));
  }
}
