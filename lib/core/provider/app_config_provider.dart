import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;
  String locale = 'en';


  void toggleTheme(ThemeMode mode){
    if(mode == themeMode) return;
    themeMode = mode;
    notifyListeners();
  }

  void changeLocale(String newLocale){
    if(newLocale == locale) return;
    locale = newLocale;
    notifyListeners();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
  bool get isEn => locale == "en";
}