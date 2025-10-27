import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: Colors.white,
    ),
  );
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: Colors.black,
    ),
  );
}
