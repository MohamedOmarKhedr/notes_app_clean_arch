import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getApplicationTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Poppins',
      
    );
  }

}