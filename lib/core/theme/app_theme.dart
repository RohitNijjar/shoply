import 'package:flutter/material.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/core/theme/custom_theme/app_bottom_nav_bar_theme.dart';
import 'package:shoply/core/theme/custom_theme/app_button_theme.dart';
import 'package:shoply/core/theme/custom_theme/app_text_theme.dart';

final class AppTheme {
  const AppTheme._();

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppPalette.primaryColor,
    onPrimary: AppPalette.white1,
    secondary: AppPalette.white1,
    onSecondary: AppPalette.textColor,
    error: AppPalette.errorColor,
    onError: AppPalette.white1,
    surface: AppPalette.white1,
    onSurface: AppPalette.textColor,
    secondaryContainer: AppPalette.lightWhite,
    onSecondaryContainer: AppPalette.textColor,
    tertiary: AppPalette.accentColor,
    onTertiary: Colors.black,
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: _lightColorScheme,
    elevatedButtonTheme: AppButtonTheme.lightElevetedButtonTheme,
    iconTheme: const IconThemeData().copyWith(
      color: AppPalette.fieldIconColor,
      size: 22,
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      hintStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: AppPalette.blueGrey,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppPalette.grey2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppPalette.grey2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.all(10),
    ),
    bottomNavigationBarTheme:
        AppBottomNavigationBarTheme.lightBottomNavigationBarTheme,
  );
}
