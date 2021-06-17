import 'package:pdf/widgets.dart';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

save(Document pdf) async {
  final String downloadDir = (await getDownloadsDirectory()).path;
  final String path =
      '$downloadDir/primo_${DateFormat('yyyy_MM_dd_kk_mm_ss').format(DateTime.now())}.pdf';
  final File file = File(path);
  print('path: $path');
  await file.writeAsBytes(await pdf.save());
}
