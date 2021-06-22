// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theming/theme_manager.dart';
import 'MyApp.dart';
import 'package:window_size/window_size.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('navtool');
    setWindowMinSize(const Size(380, 500));
    setWindowMaxSize(Size.infinite);
  }

  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}
