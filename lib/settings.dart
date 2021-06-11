import 'package:flutter/material.dart';
import 'theming/theme_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'SideDrawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:settings_ui/settings_ui.dart';

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
              drawer: magheggio(theme.isDark),
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
                    title: AppLocalizations.of(context)!.settingsInterface,
                    tiles: [
                      SettingsTile.switchTile(
                        title: AppLocalizations.of(context)!
                            .settingsInterfaceTheme,
                        leading: Icon(Icons.mode_night),
                        switchValue: isBlack,
                        onToggle: (bool isBlack) {
                          theme.changeMode();
                          isBlack = !isBlack;
                        },
                      ),
                    ],
                  ),
                ],
                backgroundColor: Color(0xFF212121),
              ),
            ));
  }
}
