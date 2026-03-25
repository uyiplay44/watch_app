import 'package:flutter/material.dart';
import 'package:watch_app/core/theme/color_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallete.bgColorDarkMode,
    appBarTheme: AppBarTheme(backgroundColor: ColorPallete.bgColorDarkMode),
  );
}
