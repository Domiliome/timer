import 'package:flutter/material.dart';
import 'colors.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.dark(surface: AppColors.background.light),
  textTheme: lightTextTheme,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(surface: AppColors.background.dark),
);

final TextTheme lightTextTheme = TextTheme(
  bodyMedium: const TextStyle(
    fontFamily: 'monospace',
    color: Color(0xff000000),
    fontWeight: FontWeight.normal,
    fontSize: 24,
  ),
);
final TextTheme darkTextTheme = TextTheme(
  bodyMedium: const TextStyle(
    fontFamily: 'monospace',
    color: Color(0xfff7f7f7),
    fontWeight: FontWeight.normal,
    fontSize: 24,
  ),
);
