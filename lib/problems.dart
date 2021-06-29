import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Problems extends StatefulWidget {
  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  Iterable<int> a = [0x00B0];
  final double sumMenuItemSmall = 12;
  final double expTitleSmall = 18;
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
            AppLocalizations.of(context)!.problems,
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
                AppLocalizations.of(context)!.linearNavTitle,
                style: TextStyle(
                    fontSize: expTitleSmall, fontWeight: FontWeight.w600),
              ),
              children: <Widget>[
                Divider(
                  color: Colors.blue,
                  thickness: 3,
                ),
                ListTile(
                  leading: Icon(Icons.local_airport_sharp),
                  title: Text(
                    AppLocalizations.of(context)!.meridNavTitle,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onTap: () => {
                    Navigator.pushNamed(
                      context,
                      '/NavMer1',
                    ),
                  },
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
                  children: groupCreator([
                    'navigazione per paralleli',
                    'navigazione per paralleli corretto'
                  ], [
                    '/NavPar1',
                    '/PriPag'
                  ], context, false),
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
            // Divider(
            //   color: Colors.grey[900],
            // ),
            // ListTile(
            //   leading: Icon(Icons.flight_takeoff_sharp),
            //   title: Text(
            //     AppLocalizations.of(context)!.climbTitle,
            //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            //   ),
            //   onTap: () => {
            //     Navigator.pushNamed(
            //       context,
            //       '/salita',
            //     ),
            //   },
            // ),
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
          ],
        )));
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
