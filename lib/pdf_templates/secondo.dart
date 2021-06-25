import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'pdfSaver.dart';

void secondoPdfCreator(
    num th, num tas, num windAngle, num windVel, Uint8List img, context) async {
  Document pdf = Document();
  pdf.addPage(MultiPage(
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
                    'gamma = ${(th < windAngle) ? "wind angle originale - th" : "th - wind angle originale"}'),
                Icon(IconData(57499, matchTextDirection: true)),
                Text(
                    '${(th < windAngle) ? "$windAngle - $th" : "$th - $windAngle"}'),
                Text('${(th < windAngle) ? windAngle - th : th - windAngle} '),
              ],
            ),
            Row(
              children: [
                Text(
                    'gamma = ${(th < windAngle) ? "wind angle originale - th" : "th - wind angle originale"}'),
                Icon(IconData(57499, matchTextDirection: true)),
                Text(
                    '${(th < windAngle) ? "$windAngle - $th" : "$th - $windAngle"} = '),
                Text('${(th < windAngle) ? windAngle - th : th - windAngle} '),
              ],
            ),
          ]));

  save(pdf);
}
