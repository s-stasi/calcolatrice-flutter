import 'package:flutter/material.dart';

typedef num func(num arg);

class ReversableConversion extends StatefulWidget {
  final List<func>? functions;
  final String title;
  final String first;
  final String second;
  const ReversableConversion({@required this.functions, @required this.title = 'n', @required this.first = 'n', @required this.second = 'n'});

  @override
  _ReversableConversionState createState() => _ReversableConversionState();
}

class _ReversableConversionState extends State<ReversableConversion> {
  final controller = TextEditingController();
  int selector = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(__update);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade900, width: 3.0),
                    ),
                    labelText: (selector == 0) ? widget.first : widget.second,
                    helperText: (selector == 0) ? widget.first : widget.second,
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              IconButton(
                icon: Icon(Icons.compare_arrows),
                iconSize: 38,
                onPressed: () {invert();}
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
              Expanded(
                child: Text(
                  '${(selector == 0) ? widget.second : widget.first}: ${result()}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04, height: 150),
            ],
          )
        ],
      ),
    );
  }

  num result() {
    return widget.functions![selector](num.tryParse(controller.text) ?? 0);
  }

  void invert() {
    setState(() {selector == 0 ? selector = 1 : selector = 0;});
  }
  void __update() {
    setState(() {});
  }
}
