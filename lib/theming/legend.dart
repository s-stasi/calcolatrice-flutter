import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height * 0.079,
      margin: EdgeInsets.all(25.0),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: Colors.red,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              'ground speed',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              'true air speed',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              color: Colors.yellow,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              ' wind velocity',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
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
