
import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';

class SecondoProblema extends StatefulWidget {
     @override
    _SPState createState() => _SPState(); 
}

class _SPState extends State<SecondoProblema> {
   final th = TextEditingController();
   final tas = TextEditingController();
   final windAngle  = TextEditingController();
   final windVel = TextEditingController();

   @override 
   void dispose() {
     th.dispose();
     tas.dispose();
     windAngle.dispose();
     windVel.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('SECONDO PROBLEMA'),
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
      body: Row(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20
          ),
           Expanded(
              child: TextField(
                controller: th,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),
                    labelText: 'TH',
                    ),
               )
             ),
         Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20
          ),
           Expanded(
              child: TextField(
                controller: tas,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),
                    labelText: 'TAS',
                    ),
               )
             ),
         Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20
          ),
           Expanded(
              child: TextField(
                controller: windAngle,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),
                    labelText: 'WIND ANGLE',
                    ),
               )
             ),
         Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20
          ),
           Expanded(
              child: TextField(
                controller: windVel,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900,width: 3.0)),
                    labelText: 'WIND WELOCITY',
                    ),
               )
             ),
          FloatingActionButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    'tc: ' + secondoProblema(int.parse(th.text), int.parse(tas.text), int.parse(windAngle.text), int.parse(windVel.text))[0].toString() + ' gs: ' + secondoProblema(int.parse(th.text), int.parse(tas.text), int.parse(windAngle.text), int.parse(windVel.text))[1].toString()
                  )
                );
              }
            ),
            child: Text('='),
          )
        ]
      )
    );
  }
}
