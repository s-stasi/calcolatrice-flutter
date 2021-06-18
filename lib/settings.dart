import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'SideDrawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:settings_ui/settings_ui.dart';
import 'services/storage_manager.dart';
import 'MyApp.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Impostazioni extends StatefulWidget {
  @override
  ImpostazioniState createState() => ImpostazioniState();
}

class ImpostazioniState extends State<Impostazioni> {
  late bool isBlack;

  magheggio(bool e) {
    isBlack = e;
    return SideDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.menu_open, title: 'Problems'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (int i) {
            if (i == 0) Navigator.pushNamed(context, '/');
            if (i == 1) Navigator.pushNamed(context, '/');
            if (i == 2) Navigator.pushNamed(context, '/ImpPag');
          },
        ),
        drawer: magheggio(theme.isDark),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.settingsTitle,
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
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.switchTile(
                  title: AppLocalizations.of(context)!.settingsInterfaceTheme,
                  leading: Icon(Icons.mode_night),
                  switchValue: isBlack,
                  onToggle: (bool isBlack) {
                    theme.changeMode();
                    isBlack = !isBlack;
                  },
                ),
                SettingsTile(
                  title: AppLocalizations.of(context)!.settingsLanguage,
                  leading: Icon(Icons.language),
                  onPressed: (context) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Language(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
          darkBackgroundColor: Color(0xFF212121),
          lightBackgroundColor: Color(0xFFE5E5E5),
        ),
      ),
    );
  }
}

class Language extends StatefulWidget {
  @override
  LanguageState createState() => LanguageState();
}

class LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: AppLocalizations.of(context)!.settingsLanguage,
            tiles: builder(
                titles: ['English', 'Italiano'],
                languageCodes: ['en', 'it'],
                context: context),
          ),
        ],
        darkBackgroundColor: Color(0xFF212121),
        lightBackgroundColor: Color(0xFFE5E5E5),
      ),
    );
  }
}

List<SettingsTile> builder(
    {required List<String> titles,
    required List<String> languageCodes,
    required BuildContext context}) {
  List<SettingsTile> list = [];
  for (var i = 0; i <= titles.length - 1; i++) {
    list.add(SettingsTile(
      title: titles[i],
      leading: Localizations.localeOf(context).languageCode == languageCodes[i]
          ? Icon(Icons.check)
          : Icon(null),
      onPressed: (BuildContext context) {
        StorageManager.saveData('locale', languageCodes[i]);
        MyApp.of(context)
            .setLocale(Locale.fromSubtags(languageCode: languageCodes[i]));
      },
    ));
  }
  return list;
}
