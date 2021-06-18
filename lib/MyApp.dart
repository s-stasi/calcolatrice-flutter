import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'PrimaPag.dart';
import 'SecondaPag.dart';
import 'TerzaPag.dart';
import 'QuartaPag.dart';
import 'MyHomePage.dart';
import 'PrimoLossodromia.dart';
import 'SecondoLossodromia.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Salita.dart';
import 'Meri1.dart';
import 'Meri2.dart';
import 'Paral1.dart';
import 'paral2.dart';
import 'problems.dart';
import 'settings.dart';
import 'explanations/explanations.dart';
import 'explanations/expmkt.dart';
import 'services/storage_manager.dart';

var modalita;

class MyApp extends StatefulWidget {
  @override
  _MAState createState() => _MAState();

  static _MAState of(BuildContext context) =>
      context.findAncestorStateOfType<_MAState>()!;
}

class _MAState extends State<MyApp> {
  //Locale _locale = Locale.fromSubtags(languageCode: (() => await StorageManager.readData('locale'))() ?? 'en');
  dynamic _locale = StorageManager.readData('locale').then((value) {
    if (value != null) return Locale.fromSubtags(languageCode: value);
    return Locale.fromSubtags(languageCode: 'en');
  });

  void setLocale(Locale value) {
    setState(() {
      _locale = StorageManager.readData('locale').then((value) {
        if (value != null) return Locale.fromSubtags(languageCode: value);
        return Locale.fromSubtags(languageCode: 'en');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _locale,
        builder: (BuildContext context, AsyncSnapshot<dynamic> loc) =>
            Consumer<ThemeNotifier>(
                builder: (context, theme, child) => MaterialApp(
                      locale: (loc.hasData)
                          ? Locale.fromSubtags(
                              languageCode: loc.data.toString())
                          : Locale.fromSubtags(languageCode: 'en'),
                      onGenerateTitle: (BuildContext context) =>
                          AppLocalizations.of(context)!.gayyy,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
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
                        '/NavPar2': (context) => Paral2(),
                        '/NavMer2': (context) => Meri2(),
                        '/Problems': (context) => Problems(),
                        '/explanations': (context) => Explanations(),
                        '/expMTK': (context) => ExpMTK()
                      },
                    )));
  }
}
