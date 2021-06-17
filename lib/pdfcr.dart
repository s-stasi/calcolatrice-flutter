import 'dart:typed_data';
import 'package:flutter/material.dart' as material;
import 'pdf_templates/primo.dart';

class PdfBuilder {
  material.BuildContext context;
  Uint8List? img;
  num? windVel;
  num? tas;
  num? tc;
  num? windAngle;

  PdfBuilder.primo(
      {required this.tc,
      required this.tas,
      required this.windAngle,
      required this.windVel,
      required this.img,
      required this.context}) {
    primoPdfCreator(tc!, tas!, windAngle!, windVel!, img!, context);
  }
}
