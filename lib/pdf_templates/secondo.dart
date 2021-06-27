import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'pdfSaver.dart';
import 'dart:math' as Math;

toRad(num deg) {
  return deg * Math.pi / 180;
}

toDeg(num rad) {
  return rad * 180 / Math.pi;
}

void secondoPdfCreator(
    num th, num tas, num windAngle, num windVel, Uint8List img, context) async {
  Document pdf = Document();
  final gamma = (th < windAngle) ? windAngle - th : th - windAngle;
  final gs = Math.sqrt(Math.pow(windVel, 2) +
      Math.pow(tas, 2) -
      (2 * windVel * tas * Math.cos(toRad(gamma))));
  final wca = toDeg(Math.asin((windVel * Math.sin(toRad(gamma))) / gs));
  final alpha = 180 - gamma - wca;
  pdf.addPage(
    MultiPage(
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
                  Text('secondo problema del vento', textScaleFactor: 2),
                  PdfLogo()
                ])),
        Header(
          level: 1,
          child: Text('Dati'),
        ),
        Paragraph(
            text: 'Th: $th\n'
                'Tas: $tas\n'
                'Wind angle: $windAngle\n'
                'Wind velocity: $windVel\n',
            textAlign: TextAlign.left),
        Padding(padding: const EdgeInsets.all(10)),
        Center(child: Image(MemoryImage(img), height: 200, width: 200)),
        Padding(padding: const EdgeInsets.all(10)),
        Row(
          children: [
            Text(
                'gamma = ${(th < windAngle) ? "wind angle originale - th" : "th - wind angle originale"} = '),
            // Icon(IconData(57499, matchTextDirection: true)),
            Text(
                '${(th < windAngle) ? "$windAngle - $th" : "$th - $windAngle"} = '),
            Text('$gamma'),
            // TODO: add degree symbol
          ],
        ),
        Padding(padding: const EdgeInsets.all(7)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'gs = sqrt(wind velocity^2 + tas^2 - (2 * wind velocity * tas * cos(gamma)))'),
            // Icon(IconData(57499, matchTextDirection: true)),
            Text(
                '     = sqrt($windVel^2 + $tas^2 - (2 * $windVel * $tas * cos($gamma)))'),
            Text('     = ${gs.round()} kt'),
          ],
        ),
        Padding(padding: const EdgeInsets.all(7)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('wca = asin((wind velocity * sin(gamma)) / gs)'),
            // Icon(IconData(57499, matchTextDirection: true)),
            Text('       = asin(($windVel * sin($gamma)) / gs);'),
            Text('       = ${wca.round()}'),
          ],
        ),
        Padding(padding: const EdgeInsets.all(7)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('alpha = 180 - gamma - wca'),
            // Icon(IconData(57499, matchTextDirection: true)),
            Text('          = 180 - $gamma - $wca'),
            Text('          = $alpha'),
          ],
        ),
      ],
    ),
  );

  save(pdf);
}
