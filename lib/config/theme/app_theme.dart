import 'package:flutter/material.dart';

final Color myColor = const Color(0xFF1f8184);

MaterialColor myPrimaryColor = MaterialColor(
  myColor.value,
  <int, Color>{
    50: myColor.withOpacity(0.1),
    100: myColor.withOpacity(0.2),
    200: myColor.withOpacity(0.3),
    300: myColor.withOpacity(0.4),
    400: myColor.withOpacity(0.5),
    500: myColor.withOpacity(0.6),
    600: myColor.withOpacity(0.7),
    700: myColor.withOpacity(0.8),
    800: myColor.withOpacity(0.9),
    900: myColor.withOpacity(1),
  },
);

class Apptheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      // colorSchemeSeed: Colors.teal,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: myPrimaryColor,
          accentColor: const Color(0xFF7cc4c7),
          backgroundColor: Colors.white),
      appBarTheme: const AppBarTheme(centerTitle: true));
}
