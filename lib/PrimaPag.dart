import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './SideDrawer.dart';

class PrimoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('PRIMO PROBLEMA'),
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
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'TC',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'TAS',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'WIND VELOCITY',),
             )
           ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),labelText: 'WIND ANGLE',),
             )
           ),
        ]
      )
    );
  }
}
