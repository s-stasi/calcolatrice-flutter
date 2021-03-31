import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';

class Impostazioni extends StatelessWidget {
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
        child: Text('impostazioni pagina...'),
      ),
    );
  }
}
