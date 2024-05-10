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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.black45,
    backgroundColor: Color.fromARGB(245, 247, 125, 166),
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
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return Colors.blue;
      }),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.infinity, 48),
      ),
    ),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //         // here we need a way to access state variable 'buttonIsDisabled'

  //         // backgroundColor: buttonIsDisabled
  //         //     ? Colors.grey[500]
  //         //     : Colors.blue,
  //         foregroundColor: Colors.white,
  //         shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10))),
  //         minimumSize: const Size(100, 60))
  //         )
);
