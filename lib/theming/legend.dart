import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25.0),
      height: 120,
      width: 210,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.red,
                size: 17,
              ),
              SizedBox(width: 10),
              Text(
                'ground speed',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.brightness_1,
                color: Colors.black,
                size: 17,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'true air speed',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
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
                size: 17,
              ),
              SizedBox(width: 10),
              Text(
                'Wind velocity',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          border: Border.all(
            color: Colors.blue,
            width: 5,
          )),
    );
  }
}
