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
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('quarta pagina...'),
      ),
    );
  }
}
