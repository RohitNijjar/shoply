import 'package:flutter/material.dart';
import 'package:shoply/core/theme/app_palette.dart';

final class AppButtonTheme {
  const AppButtonTheme._();

  static ElevatedButtonThemeData lightElevetedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppPalette.white1,
      backgroundColor: AppPalette.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppPalette.white1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  );
}
