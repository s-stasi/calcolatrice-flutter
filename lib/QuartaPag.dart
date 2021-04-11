import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';
import 'problemiDelVento/problems.dart';

class QuartoProblema extends StatefulWidget {
  @override
  _QPState createState() => _QPState();
}

class _QPState extends State<QuartoProblema> {

   final th = TextEditingController();
   final tas = TextEditingController();
   final tc  = TextEditingController();
   final gs = TextEditingController();

   @override 
   void dispose() {
     th.dispose();
     tas.dispose();
     tc.dispose();
     gs.dispose();
     super.dispose();
   }


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
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
          child: TextField(
            controller: th,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 3.0)),
              labelText: 'TH',
            ),
          ),
        ),
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
          child: TextField(
            controller: tas,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 3.0)),
              labelText: 'TAS',
            ),
          ),
        ),
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
          child: TextField(
            controller: tc,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 3.0)),
              labelText: 'TC',
            ),
          ),
        ),
          Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        Expanded(
          child: TextField(
            controller: gs,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 3.0)),
              labelText: 'GS',
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.20),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Text('Wind Angle: ' +
                      quartoProblema(
                              int.parse(th.text),
                              int.parse(tas.text),
                              int.parse(tc.text),
                              int.parse(gs.text))[0]
                          .toString() +
                      ' Wind Vel: ' +
                      quartoProblema(                                       
                              int.parse(th.text),
                              int.parse(tas.text),
                              int.parse(tc.text),
                              int.parse(gs.text))[1]
                          .toString()));
            }
            ),
        child: Text('   =   '),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
