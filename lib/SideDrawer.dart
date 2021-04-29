import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  Iterable<int> a = [0x00B0];
  final double sumMenuItemSmall = 12;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              "Problemi del vento",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.local_airport,
                  size: 18,
                ),
                title: Text(
                  '1' + String.fromCharCodes(a) + 'problema del vento',
                  style: TextStyle(
                      fontSize: sumMenuItemSmall, fontWeight: FontWeight.w600),
                ),
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    '/PriPag',
                  ),
                },
              ),
              Divider(
                color: Colors.grey[900],
              ),
              ListTile(
                leading: Icon(
                  Icons.local_airport,
                  size: 18,
                ),
                title: Text(
                  '2' + String.fromCharCodes(a) + ' problema del vento',
                  style: TextStyle(
                      fontSize: sumMenuItemSmall, fontWeight: FontWeight.w600),
                ),
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    '/SecPag',
                  ),
                },
              ),
              Divider(
                color: Colors.grey[900],
              ),
              ListTile(
                leading: Icon(
                  Icons.local_airport,
                  size: 18,
                ),
                title: Text(
                  '3' + String.fromCharCodes(a) + ' problema del vento',
                  style: TextStyle(
                      fontSize: sumMenuItemSmall, fontWeight: FontWeight.w600),
                ),
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    '/TerPag',
                  ),
                },
              ),
              Divider(
                color: Colors.grey[900],
              ),
              ListTile(
                leading: Icon(
                  Icons.local_airport,
                  size: 18,
                ),
                title: Text(
                  '4' + String.fromCharCodes(a) + ' problema del vento',
                  style: TextStyle(
                      fontSize: sumMenuItemSmall, fontWeight: FontWeight.w600),
                ),
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    '/QuaPag',
                  ),
                },
              ),
            ],
          ),
          Divider(
            color: Colors.grey[900],
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text(
              'calcolatrice principale',
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
            leading: Icon(Icons.settings_outlined),
            title: Text(
              'impostazioni',
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
    );
  }
}
