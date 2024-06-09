import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color.fromARGB(136, 4, 45, 106),
    backgroundColor: Color.fromARGB(255, 229, 191, 255),
  ),
  badgeTheme: const BadgeThemeData(
    offset: Offset(-1, 2),
    backgroundColor: Colors.green,
    textStyle: TextStyle(fontSize: 15),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white,
    selectedColor: Colors.red,
    showCheckmark: false,
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    side: BorderSide(
      color: Colors.red.shade100,
      width: 1,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade400;
        }
        return Colors.blue;
      }),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      fixedSize: WidgetStateProperty.all(
        const Size(double.infinity, 48),
      ),
    ),
  ),
);
