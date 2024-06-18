import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFDBBC97);
  static const Color secondaryColor = Color(0xFFBD3961);
  static const Color tertiaryColor = Color(0xFF93995F);
  static const Color backgroundColorLight = Color(0xFFF4F6E9);
  static const Color backgroundColorDark = Color(0xFF291E34);
  static const Color accentColor = Color(0xFF93995F);
  static const Color darkAccentColor = Color(0xFFBD3961);
  static const Color textOnLightBgColor = Color(0xFF291E34);
  static const Color textOnDarkBgColor = Color(0xFFF4F6E9);

  static const LinearGradient bgGradient = LinearGradient(
    colors: [
      darkAccentColor,
      primaryColor,
    ],
  );
}
