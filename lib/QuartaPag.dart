import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';

class QuartoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('QUARTO PROBLEMA'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue,
              ]
            )
          ),
        ), 
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'TH',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'TAS',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'TC',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'GS',),
             )
           ),
        ]
      )
    );
  }
}
