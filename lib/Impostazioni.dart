/*
import 'dart:async';
import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'MyApp.dart';


class Impostazioni extends StatefulWidget {
  @override 
  ImpostazioniState createState() => ImpostazioniState();
}

class ImpostazioniState extends State<Impostazioni> {

  bool status = false;
  var modalita ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('IMPOSTAZIONI'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.grey,
              ]
            )
          ),
        ), 
      ),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              activeColor: Colors.white,
              value: status,
              onChanged: (value) {
                if(value == true) modalita = 'light mode';
                else modalita = 'dark mode';
                setState(() {
                  status = value;
                });
              },
            ),
            SizedBox(height: 12.0,),
            Text('modalità : $modalita', style: TextStyle(
              color: Colors.black,
              fontSize: 20.0
            ),
           )
          ],
        ),
      )
    );
  }
}*/
