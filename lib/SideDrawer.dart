import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SideDrawer extends StatelessWidget {
  Iterable<int> a = [0x00B0];
  final double sumMenuItemSmall = 12;
  final double expTitleSmall = 18;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
              gradient: LinearGradient(colors: [
                Colors.black,
                Colors.blue,
              ]),
            ),
          ),
          ExpansionTile(
            title: Text(
              AppLocalizations.of(context)!.linearNavTitle,
              style: TextStyle(
                  fontSize: expTitleSmall, fontWeight: FontWeight.w600),
            ),
            children: <Widget>[
              Divider(
                color: Colors.blue,
                thickness: 3,
              ),
              ExpansionTile(
                title: Text(
                  AppLocalizations.of(context)!.meridNavTitle,
                  style: TextStyle(
                      fontSize: expTitleSmall, fontWeight: FontWeight.w600),
                ),
                children: groupCreator(
                    ['incognite: TC/D', 'incognite: Coordinate B'],
                    ['/NavMer1', '/NavMer2'],
                    context,
                    false),
              ),
              Divider(
                color: Colors.grey[900],
              ),
              ExpansionTile(
                title: Text(
                  AppLocalizations.of(context)!.paralNavTitle,
                  style: TextStyle(
                      fontSize: expTitleSmall, fontWeight: FontWeight.w600),
                ),
                children: groupCreator(
                    ['incognite: TC/D', 'incognite: Coordinate B'],
                    ['/NavPar1', '/PriPag'],
                    context,
                    false),
              ),
              Divider(
                color: Colors.blue,
                thickness: 3,
              ),
            ],
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ExpansionTile(
            title: Text(
              AppLocalizations.of(context)!.wpTitle,
              style: TextStyle(
                  fontSize: expTitleSmall, fontWeight: FontWeight.w600),
            ),
            children: groupCreator([
              '1' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.wpSingular,
              '2' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.wpSingular,
              '3' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.wpSingular,
              '4' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.wpSingular
            ], [
              '/PriPag',
              '/SecPag',
              '/TerPag',
              '/QuaPag'
            ], context),
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ExpansionTile(
            title: Text(
              AppLocalizations.of(context)!.rhumbTitle,
              style: TextStyle(
                  fontSize: expTitleSmall, fontWeight: FontWeight.w600),
            ),
            children: groupCreator([
              '1' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.rhumbSingular,
              '2' +
                  String.fromCharCodes(a) +
                  AppLocalizations.of(context)!.rhumbSingular
            ], [
              '/priLos',
              '/secLos'
            ], context),
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_sharp),
            title: Text(
              AppLocalizations.of(context)!.climbTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/salita',
              ),
            },
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text(
              AppLocalizations.of(context)!.calculatorTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/',
              ),
            },
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text(
              AppLocalizations.of(context)!.expTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/explanations',
              ),
            },
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              AppLocalizations.of(context)!.settingsTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/ImpPag',
              ),
            },
          ),
          Divider(
            color: Colors.grey[900],
          ),
        ],
      ),
    ));
  }
}

List<Widget> groupCreator(
    List<String> titles, List<String> paths, BuildContext context,
    [bool blueDiv = true]) {
  if (titles.length != paths.length) {
    throw Exception('Titles and paths number must match');
  }

  List<Widget> group = [];
  for (var i = 0; i <= titles.length - 1; i++) {
    if (i == 0) {
      group.add(Divider(
        color: blueDiv ? Colors.blue : Colors.grey[900],
        thickness: 3,
      ));
    }
    group.add(ListTile(
      leading: Icon(
        Icons.local_airport_sharp,
        size: 18,
      ),
      title: Text(
        titles[i],
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
      onTap: () => {
        Navigator.pushNamed(
          context,
          '${paths[i]}',
        ),
      },
    ));

    if (i == titles.length - 1) {
      group.add(Divider(
        color: Colors.blue,
        thickness: 3,
      ));
    } else {
      group.add(Divider(
        color: blueDiv ? Colors.blue : Colors.grey[900],
      ));
    }
  }
  return group;
}
