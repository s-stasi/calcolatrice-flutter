/* import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'theming/theme_manager.dart';

class ImpostazioniState extends StatelessWidget {
  Widget build(BuildContext context, ThemeNotifier theme) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        drawer: SideDrawer(),
        appBar: AppBar(
          title: Text('IMPOSTAZIONI'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.grey,
            ])),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () => {
                        print('set light theme'),
                        theme.setLightMode(),
                      },
                  child: Text('set light theme')),
              TextButton(
                  onPressed: () => {
                        print('set dark theme'),
                        theme.setDarkMode(),
                      },
                  child: Text('set dark theme')),
            ],
          ),
        ));
  }
}
 */
