import 'package:flutter/material.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {
  late bool isDarkB = true;
  final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.lightBlueAccent,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12);

  final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.blue,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.lightBlue,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54);

  late ThemeData _themeData = ThemeData();
  ThemeData getTheme() => _themeData;

  get isDark => isDarkB;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
        isDarkB = false;
      } else {
        print('setting dark mode');
        _themeData = darkTheme;
        isDarkB = true;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  void changeMode() {
    isDarkB = !isDarkB;
    print('isDark: $isDarkB');
    _themeData = (isDarkB) ? darkTheme : lightTheme;
    StorageManager.saveData('themeMode', (isDarkB) ? 'dark' : 'light');
    notifyListeners();
  }
}
