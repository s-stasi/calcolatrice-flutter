import 'dart:typed_data';
import 'package:NAVTOOL/PrimaPag.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'pdfSaver.dart';

void primoPdfCreator(
    num tc, num tas, num windAngle, num windVel, Uint8List img, context) async {
  Document pdf = Document();
  final font = await rootBundle.load("arial.ttf");
  final ttf = Font.ttf(font);
  // final fontBold = await rootBundle.load("asset/open-sans-bold.ttf");
  // final ttfBold = pdf.Font.ttf(fontBold);
  // final fontItalic = await rootBundle.load("asset/open-sans-italic.ttf");
  // final ttfItalic = pdf.Font.ttf(fontItalic);
  // final fontBoldItalic = await rootBundle.load("asset/open-sans-italic.ttf");
  // final ttfBoldItalic = pdf.Font.ttf(fontBoldItalic);
  final ThemeData theme = ThemeData.withFont(
    base: ttf,
  );
  pdf.addPage(MultiPage(
        theme: theme,
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {}
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: PdfColors.grey, width: 0.5))),
            child: Text('Report',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
            Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('primo problema del vento', textScaleFactor: 2),
                      PdfLogo()
                    ])),
            Header(
              level: 1,
              child: Text('Dati'),
            ),
            Paragraph(
                text: 'Tc: $tc\n'
                    'Tas: $tas\n'
                    'Wind angle: $windAngle\n'
                    'Wind velocity: $windVel\n',
                textAlign: TextAlign.left),
            Padding(padding: const EdgeInsets.all(10)),
            Center(child: Image(MemoryImage(img), height: 200, width: 200)),
            Padding(padding: const EdgeInsets.all(10)),
            Row(
              children: [
                Text('text'),
                Icon(IconData(57499, matchTextDirection: true)),
                Text('text'),
              ],
            ),
          ]));

  save(pdf);
}
