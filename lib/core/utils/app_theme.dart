import 'package:easeup/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define your theme-related properties and methods here

  // Define a method to create a light theme:
  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        background: AppColors.backgroundColorLight,
        primary: AppColors.primaryColor,
        secondary: AppColors.accentColor,
      ),
      // AppBar customization
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textOnDarkBgColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        // app bar title
        displaySmall: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          color: AppColors.textOnDarkBgColor,
        ),
        // Headline
        headlineLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.red,
        ),
        // Title
        titleLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.green,
        ),
        // SubTitle
        titleMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.blue,
        ),
        // Body
        bodyLarge: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
          color: AppColors.textOnLightBgColor,
        ),
        // Body
        bodyMedium: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
          color: AppColors.textOnLightBgColor,
        ),
      ),
    );
  }

  // Define a method to create a dark theme:
  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: AppColors.backgroundColorDark,
        primary: AppColors.primaryColor,
        secondary: AppColors.accentColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkAccentColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        // app bar title
        displaySmall: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
          color: AppColors.textOnDarkBgColor,
        ),
        // Headline
        headlineLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.red,
        ),
        // Title
        titleLarge: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.green,
        ),
        // SubTitle
        titleMedium: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          color: Colors.blue,
        ),
        // Body
        bodyLarge: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
          color: AppColors.textOnDarkBgColor,
        ),
        // Body
        bodyMedium: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
          color: AppColors.textOnDarkBgColor,
        ),
      ),
    );
  }
}
