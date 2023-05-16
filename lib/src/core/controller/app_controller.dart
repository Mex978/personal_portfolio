import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void changeThemeMode() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
