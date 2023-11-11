import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getAppTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.lightBlueAccent,
      brightness: Brightness.dark,
    );
  }
}