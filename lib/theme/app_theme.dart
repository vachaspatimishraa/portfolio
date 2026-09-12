import 'package:flutter/material.dart';

class AppColors {
  // Dark Theme Tokens
  static const Color darkBg = Color(0xFF0A0D14);
  static const Color darkSurface = Color(0xFF111726);
  static const Color darkElevated = Color(0xFF182238);
  static const Color darkBorder = Color(0xFF23304E);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkTextMuted = Color(0xFF64748B);
  static const Color darkAccent = Color(0xFF6366F1); // Indigo
  static const Color darkAccentHover = Color(0xFF818CF8);
  static const Color darkCyan = Color(0xFF38BDF8);

  // Light Theme Tokens
  static const Color lightBg = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightElevated = Color(0xFFF1F5F9);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);
  static const Color lightTextMuted = Color(0xFF94A3B8);
  static const Color lightAccent = Color(0xFF4F46E5);
  static const Color lightAccentHover = Color(0xFF4338CA);
  static const Color lightCyan = Color(0xFF0284C7);
}

class AppTheme {
  static const String fontFamily = 'Plus Jakarta Sans';

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    primaryColor: AppColors.darkAccent,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkAccent,
      secondary: AppColors.darkCyan,
      surface: AppColors.darkSurface,
      surfaceContainerHighest: AppColors.darkElevated,
      onPrimary: Colors.white,
      onSurface: AppColors.darkTextPrimary,
      outline: AppColors.darkBorder,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.darkBorder, width: 1),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.darkElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkBorder),
      ),
      textStyle: const TextStyle(
        color: AppColors.darkTextPrimary,
        fontSize: 12,
        fontFamily: fontFamily,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    primaryColor: AppColors.lightAccent,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightAccent,
      secondary: AppColors.lightCyan,
      surface: AppColors.lightSurface,
      surfaceContainerHighest: AppColors.lightElevated,
      onPrimary: Colors.white,
      onSurface: AppColors.lightTextPrimary,
      outline: AppColors.lightBorder,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.lightBorder, width: 1),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.lightElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightBorder),
      ),
      textStyle: const TextStyle(
        color: AppColors.lightTextPrimary,
        fontSize: 12,
        fontFamily: fontFamily,
      ),
    ),
  );
}

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController([super.value = ThemeMode.dark]);

  void toggleTheme() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
  }

  void setThemeMode(ThemeMode mode) {
    value = mode;
  }
}
