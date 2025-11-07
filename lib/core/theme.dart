import 'package:flutter/material.dart';

ThemeData buildTheme() {
  const milkLavender = Color(0xFFF2ECFF); // мягкий молочно-сиреневый

  final scheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: milkLavender,
    cardColor: Colors.white.withOpacity(0.9),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      isDense: true,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white.withOpacity(0.9),
      selectedColor: scheme.secondaryContainer,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: scheme.primary,
      contentTextStyle: const TextStyle(color: Colors.white),
      actionTextColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.secondaryContainer,
      foregroundColor: scheme.onSecondaryContainer,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
