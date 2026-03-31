import 'package:flutter/material.dart';
import 'package:watch_app/core/theme/theme.dart';
import 'package:watch_app/features/toggle_theme_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: ToggleThemeMode(),
    );
  }
}
