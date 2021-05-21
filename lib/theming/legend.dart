import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.079,
      margin: EdgeInsets.all(25.0),
      child: Column(children: <Widget>[
        Text(
          'groun speed',
          style: TextStyle(color: Colors.red),
        ),
        Text(
          'groun speed',
          style: TextStyle(color: Colors.red),
        ),
        Text(
          'groun speed',
          style: TextStyle(color: Colors.red),
        ),
      ]),
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          border: Border.all(
            color: Colors.blue,
            width: 5,
          )),
    );
  }
}
