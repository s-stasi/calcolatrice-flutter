import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('NAVIGATION TOOL'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade100,
              ]
            )
          ),
        ),  
      ),
      
      body: 
       Column(children: [
         Expanded(child: Container(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               Container( padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'userInput',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      ),
                      Container(padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'answer',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                       ),
                      )  
            ]
           )
          )
         ),
         Expanded(flex: 3,
         child: Container(
        child: GridView.builder(itemCount: buttons.lenght, itemBuilder: itemBuilder)
         )
         )
       ],
       )
      
    );
  }
}
