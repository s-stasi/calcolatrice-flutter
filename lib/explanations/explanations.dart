import 'package:flutter/material.dart';
import '../SideDrawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Explanations extends StatelessWidget {
  final kRouteName = '/explanations';
  late List<String> titles;
  final routes = ["/expMTK"];
  final icons = [Icons.mode_night];

  @override
  Widget build(BuildContext context) {
    titles = [AppLocalizations.of(context)!.expMachToKnots];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exp'),
      ),
      drawer: SideDrawer(),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: ListTile(
                title: Text(titles[index]),
              ),
              onTap: () {
                Navigator.pushNamed(context, routes[index]);
              },
            ),
            elevation: 5,
          );
        },
      ),
    );
  }
}
