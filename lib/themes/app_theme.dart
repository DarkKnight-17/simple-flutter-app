import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueAccent,
  ),
  colorScheme: ColorScheme.light(
    onPrimary: Colors.white,
    primary: Colors.blue,
    tertiary: Colors.grey[500],
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 15),
    displaySmall: TextStyle(color: Colors.white, fontSize: 15),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.black45,
    backgroundColor: Color.fromARGB(245, 247, 125, 166),
  ),
);
