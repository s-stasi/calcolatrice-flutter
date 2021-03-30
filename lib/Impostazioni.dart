import 'package:charcode/charcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SideDrawer.dart';

class Impostazioni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('IMPOSTAZIONI'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('impostazioni pagina...'),
      ),
    );
  }
}
