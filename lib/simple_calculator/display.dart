import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  Display({this.value: '1', this.height: 0.0});

  final String value;
  final double height;

  String get _output => value.toString();

  final LinearGradient _gradient =
      const LinearGradient(colors: [Colors.black26, Colors.black45]);

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        TextStyle().copyWith(color: Colors.white, fontWeight: FontWeight.w200);

    return Container(
        padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
        constraints: BoxConstraints.expand(height: height),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 10000),
            padding: EdgeInsets.all(32),
            //fromLTRB(32, 32, 32, 32),
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height),
            decoration: BoxDecoration(gradient: _gradient),
            child: Text(
              _output,
              style: style,
              textAlign: TextAlign.right,
            )));
  }
}
