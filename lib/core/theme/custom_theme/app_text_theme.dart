import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply/core/theme/app_palette.dart';

final class AppTextTheme {
  const AppTextTheme._();

  static TextTheme lightTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: const TextStyle().copyWith(
      fontSize: 34.0, // Use for main titles or large prominent text
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 26.0, // Use for subtitles or section headers
      fontWeight: FontWeight.bold,
      color: AppPalette.textColor,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 20.0, // Use for smaller emphasis headings
      fontWeight: FontWeight.w500, // Medium weight
      color: AppPalette.textColor,
    ),

    // Headline Text Styles
    headlineLarge: const TextStyle().copyWith(
      fontSize: 18.0, // Use for prominent headlines within sections
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 16.0, // Use for subheadings within sections
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 14.0, // Use for smaller headings within sections
      fontWeight: FontWeight.w500,
    ),

    // Body Text Styles (Main Content)
    bodyLarge: const TextStyle().copyWith(
      fontSize: 17.0, // Use for primary body text or list items
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 15.0, // Use for secondary text or captions
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 13.0, // Use for small helper text or labels
    ),
  );
}
