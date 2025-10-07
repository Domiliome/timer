import 'package:flutter/material.dart';

//#светлая тема
final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.indigo,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  brightness: Brightness.dark,
);
