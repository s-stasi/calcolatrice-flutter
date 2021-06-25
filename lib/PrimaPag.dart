import 'dart:typed_data';

import 'theming/legend.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'problems/problems.dart';
import 'problems/piano_cartesiano.dart';
import 'pdfcr.dart';

class PrimoProblema extends StatefulWidget {
  final recorder = ui.PictureRecorder();

  @override
  _PPState createState() => _PPState();
}

class _PPState extends State<PrimoProblema> {
  final tc = TextEditingController();
  final tas = TextEditingController();
  final windAngle = TextEditingController();
  final windVel = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc.addListener(_updateGraph);
    tas.addListener(_updateGraph);
    windAngle.addListener(_updateGraph);
    windVel.addListener(_updateGraph);
  }

  @override
  void dispose() {
    tc.dispose();
    tas.dispose();
    windAngle.dispose();
    windVel.dispose();
    super.dispose();
  }

  _updateGraph() {
    setState(() {});
  }

  String txt() {
    return Problems.primo(
            tc: double.tryParse(tc.text) ?? 0.0,
            tas: double.tryParse(tas.text) ?? 0.0,
            windAngle: double.tryParse(windAngle.text) ?? 0.0,
            windVel: double.tryParse(windVel.text) ?? 0.0)
        .data;
  }

  Future<Uint8List> saveImage() async {
    final Size size = Size(400, 400);
    final recorder = new ui.PictureRecorder();
    final canvas = new Canvas(recorder,
        new Rect.fromPoints(new Offset(0.0, 0.0), new Offset(400.0, 400.0)));
    PianoCartesianoPainter(
            tc: double.tryParse(tc.text) ?? 0.0,
            tas: double.tryParse(tas.text) ?? 0.0,
            windAngle: double.tryParse(windAngle.text) ?? 0.0,
            windVel: double.tryParse(windVel.text) ?? 0.0,
            problemNumber: "primo",
            context: context)
        .paint(canvas, size);
    final picture = recorder.endRecording();
    final img = await picture.toImage(400, 400);
    final bdata = await img.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = bdata!.buffer.asUint8List();
    return pngBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          'PRIMO PROBLEMA',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ])),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                PdfBuilder.primo(
                    tc: double.tryParse(tc.text) ?? 0.0,
                    tas: double.tryParse(tas.text) ?? 0.0,
                    windAngle: double.tryParse(windAngle.text) ?? 0.0,
                    windVel: double.tryParse(windVel.text) ?? 0.0,
                    img: await saveImage(),
                    context: context);
              },
              icon: Icon(Icons.print)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                child: TextField(
                  controller: tc,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'TC',
                    helperText: 'true course',
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                child: TextField(
                  controller: tas,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue.shade900, width: 3.0)),
                    labelText: 'TAS',
                    helperText: 'true air speed',
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                  child: TextField(
                controller: windAngle,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue.shade900,
                    width: 3.0,
                  )),
                  labelText: 'WIND ANGLE',
                  helperText: 'WInd angle',
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
              Expanded(
                  child: TextField(
                controller: windVel,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 3.0)),
                  labelText: 'WIND SPEED',
                  helperText: 'wind speed',
                ),
              )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.04,
                  height: MediaQuery.of(context).size.height * 0.20),
            ]),
            Text(txt(), style: TextStyle(fontSize: 25)),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.01),
            Container(
                width: MediaQuery.of(context).size.width * 0.04,
                height: MediaQuery.of(context).size.height * 0.02),
            CustomPaint(
                size: Size(
                    400 < MediaQuery.of(context).size.width
                        ? 400
                        : MediaQuery.of(context).size.width - 5,
                    400 < MediaQuery.of(context).size.width
                        ? 400
                        : MediaQuery.of(context).size.width - 5),
                painter: PianoCartesianoPainter(
                    tc: double.tryParse(tc.text) ?? 0.0,
                    tas: double.tryParse(tas.text) ?? 0.0,
                    windAngle: double.tryParse(windAngle.text) ?? 0.0,
                    windVel: double.tryParse(windVel.text) ?? 0.0,
                    problemNumber: "primo",
                    context: context)),
            Row(
              children: [
                Legend(),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
