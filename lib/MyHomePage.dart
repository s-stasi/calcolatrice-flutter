import 'SideDrawer.dart';
import 'package:flutter/material.dart';
import 'simple_calculator/display.dart';
import 'simple_calculator/key-controller.dart';
import 'simple_calculator/key-pad.dart';
import 'simple_calculator/processor.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late String _output;

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
    Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    double buttonWidth = screen.width / 4;
    double buttonHeight = screen.height / 2.2;
    double displayHeight = (screen.height - (buttonHeight * 1.9));

    debugPrint('$displayHeight');
    debugPrint('$buttonHeight');

    return Scaffold(
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'CALCOLATRICE',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Display(value: _output, height: displayHeight),
            KeyPad()
          ]),
    );
  }
}
