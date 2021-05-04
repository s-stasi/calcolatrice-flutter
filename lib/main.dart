// @dart=2.9
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theming/theme_manager.dart';
import 'MyApp.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ));
}
