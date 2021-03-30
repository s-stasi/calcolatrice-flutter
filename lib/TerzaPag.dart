import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';

class TerzoProblema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('TERZO PROBLEMA'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('terza pagina...'),
      ),
    );
  }
}
