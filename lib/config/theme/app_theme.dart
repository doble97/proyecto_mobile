import 'package:flutter/material.dart';

// final Color myColor = const Color(0xFF1f8184);

// MaterialColor myPrimaryColor = MaterialColor(
//   myColor.value,
//   <int, Color>{
//     50: myColor.withOpacity(0.1),
//     100: myColor.withOpacity(0.2),
//     200: myColor.withOpacity(0.3),
//     300: myColor.withOpacity(0.4),
//     400: myColor.withOpacity(0.5),
//     500: myColor.withOpacity(0.6),
//     600: myColor.withOpacity(0.7),
//     700: myColor.withOpacity(0.8),
//     800: myColor.withOpacity(0.9),
//     900: myColor.withOpacity(1),
//   },
// );

// const Color myColor = Color.fromARGB(255, 110, 49, 62);

// MaterialColor myPrimaryColor = MaterialColor(
//   myColor.value,
//   <int, Color>{
//     50: myColor.withOpacity(0.1),
//     100: myColor.withOpacity(0.2),
//     200: myColor.withOpacity(0.3),
//     300: myColor.withOpacity(0.4),
//     400: myColor.withOpacity(0.5),
//     500: myColor.withOpacity(0.6),
//     600: myColor.withOpacity(0.7),
//     700: myColor.withOpacity(0.8),
//     800: myColor.withOpacity(0.9),
//     900: myColor.withOpacity(1),
//   },
// );

// class Apptheme {
//   ThemeData getTheme() => ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       colorScheme: ColorScheme(
//         primary: myPrimaryColor[500]!,
//         secondary: const Color(0xFF7cc4c7),
//         surface: const Color(0xFF121212),
//         background: const Color(0xFF121212),
//         error: Colors.red,
//         onPrimary: Colors.white,
//         onSecondary: Colors.black,
//         onSurface: Colors.white,
//         onBackground: Colors.white,
//         onError: Colors.white,
//         brightness: Brightness.dark,
//       ),
//       appBarTheme: const AppBarTheme(centerTitle: true));
// }
const Color myColor = Color(0xFF303F9F);

MaterialColor myPrimaryColor = MaterialColor(
  myColor.value,
  const <int, Color>{
    50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: myColor,
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  },
);

class Apptheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      // brightness: Brightness.dark,
      colorScheme: ColorScheme(
        primary: myPrimaryColor,
        secondary: const Color(0xFF80CBC4),
        surface: Color.fromARGB(255, 246, 188, 188),
        background: const Color(0xFF121212),
        error: Color.fromARGB(255, 223, 164, 160),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true));
}
