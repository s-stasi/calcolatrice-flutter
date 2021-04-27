import 'dart:html';

import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  Iterable<int> a = [0x00B0];

  
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
            ListTile(
            leading: Icon(Icons.local_airport),
            title: Text(
              'lossodromia',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
            showMenu(context: context, position: 'cosa p0rc0d10 d3v0 m3tt3r3 ?', items: [
              PopupMenuItem<int>(
                child: 
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.local_airport),
                        title: Text(
                        '1' + String.fromCharCodes(a) + 'problema del vento',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {
                        Navigator.pushNamed(
                        context,
                        '/PriLoss',
                        ),
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.local_airport),
                        title: Text(
                        '2' + String.fromCharCodes(a) + 'problema del vento',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {
                        Navigator.pushNamed(
                        context,
                        '/SecLoss',
                        ),
                        },
                      )
                    ],
                  ),
                ],
                   
              )
            ]
            
            )
            },
          ),
          Divider(color: Colors.grey[900],),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text(
              '1' + String.fromCharCodes(a) + 'problema del vento',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/PriPag',
              ),
            },
          ),
          Divider(color: Colors.grey[900],),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text(
              '2' + String.fromCharCodes(a) + ' problema del vento',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/SecPag',
              ),
            },
          ),
          Divider(color: Colors.grey[900],),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text(
              '3' + String.fromCharCodes(a) + ' problema del vento',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/TerPag',
              ),
            },
          ),
          Divider(color: Colors.grey[900],),
          ListTile(
            leading: Icon(Icons.local_airport),
            title: Text(
              '4' + String.fromCharCodes(a) + ' problema del vento',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/QuaPag',
              ),
            },
          ),
          Divider(color: Colors.grey[900],),
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
          Divider(color: Colors.grey[900],),
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
          Divider(color: Colors.grey[900],),
        ],
      ),
    );
  }
}

