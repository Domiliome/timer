import 'package:flutter/material.dart';

class AppColors {
  static Background background = Background();
  static FontColor fontColor = FontColor();
}

class Background {
  final Color light = Color(0xfff7f7f7);
  final Color dark = Color(0xff000000);
}

/// not work
class FontColor {
  Color light = Color(0xff000000);
  Color dark = Color(0xfff7f7f7);
}
