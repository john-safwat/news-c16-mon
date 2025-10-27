import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  void toggleTheme(ThemeMode mode){
    if(mode == themeMode) return;
    themeMode = mode;
    notifyListeners();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
}