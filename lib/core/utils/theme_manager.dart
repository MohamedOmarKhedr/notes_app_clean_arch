import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class ThemeManager {
  static ThemeData getApplicationTheme() {
    final themeManager = ThemeManager();
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
        border: themeManager.buildBorder(),
        enabledBorder: themeManager.buildBorder(),
        focusedBorder: themeManager.buildBorder(color: ColorsManager.primary),
        focusColor: ColorsManager.primary,
      ),
    );
  }

  OutlineInputBorder buildBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: color),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
