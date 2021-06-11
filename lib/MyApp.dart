import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'PrimaPag.dart';
import 'SecondaPag.dart';
import 'TerzaPag.dart';
import 'QuartaPag.dart';
import 'SideDrawer.dart';
import 'Paral1.dart';
import 'MyHomePage.dart';
import 'PrimoLossodromia.dart';
import 'SecondoLossodromia.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Salita.dart';
import 'meri1.dart';
import 'settings.dart';

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
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.gayyy,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: theme.getTheme(),
              routes: {
                '/': (context) => Calculator(),
                '/PriPag': (context) => PrimoProblema(),
                '/SecPag': (context) => SecondoProblema(),
                '/TerPag': (context) => TerzoProblema(),
                '/QuaPag': (context) => QuartoProblema(),
                '/priLos': (context) => PrimoLossodromia(),
                '/secLos': (context) => SecondoLossodromia(),
                '/salita': (context) => Salita(),
                '/ImpPag': (context) => Impostazioni(),
                '/NavPar1': (context) => Paral1(),
                '/NavMer1': (context) => Meri1(),
              },
            ));
  }
}

// class Impostazioni extends StatefulWidget {
//   @override
//   ImpostazioniState createState() => ImpostazioniState();
// }

// class ImpostazioniState extends State<Impostazioni> {
//   bool status = false;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeNotifier>(
//       builder: (context, theme, child) => Scaffold(
//           drawer: SideDrawer(),
//           appBar: AppBar(
//             title: Text(
//               AppLocalizations.of(context)!.gayyy,
//               style: TextStyle(color: Colors.black),
//             ),
//             iconTheme: IconThemeData(color: Colors.black),
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Colors.grey,
//                 Colors.white,
//               ])),
//             ),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextButton(
//                     onPressed: () => {
//                           print('set light theme'),
//                           theme.setLightMode(),
//                         },
//                     child: Text('set light theme',
//                         style: TextStyle(
//                             fontSize: 30,
//                             backgroundColor: Colors.grey,
//                             color: Colors.black))),
//                 TextButton(
//                     onPressed: () => {
//                           print('set dark theme'),
//                           theme.setDarkMode(),
//                         },
//                     child: Text('set dark theme',
//                         style: TextStyle(
//                             fontSize: 30,
//                             backgroundColor: Colors.grey,
//                             color: Colors.black))),
//               ],
//             ),
//           )),
//     );
//   }
// }