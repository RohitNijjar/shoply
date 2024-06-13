import 'package:flutter/material.dart';
import 'package:shoply/core/theme/app_palette.dart';

final class AppBottomNavigationBarTheme {
  const AppBottomNavigationBarTheme._();

  static BottomNavigationBarThemeData lightBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: 8,
    backgroundColor: AppPalette.backgroundColor,
    selectedIconTheme: const IconThemeData(
      color: AppPalette.primaryColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black.withOpacity(0.5),
    ),
  );
}
