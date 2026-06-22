// lib/config/theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryDark = Color(0xFF0f172a); // slate-950
  static const Color primaryMedium = Color(0xFF0f1729); // slate-900
  static const Color primaryLight = Color(0xFF1e293b); // slate-800
  
  static const Color accentCyan = Color(0xFF06b6d4); // cyan-400
  static const Color accentBlue = Color(0xFF3b82f6); // blue-500
  static const Color accentPurple = Color(0xFFa855f7); // purple-500
  
  static const Color textPrimary = Color(0xFFffffff);
  static const Color textSecondary = Color(0xFF94a3b8); // slate-400
  static const Color textTertiary = Color(0xFF64748b); // slate-500

  static const Color colorBgPrimary = primaryDark;
  static const Color colorBgSecondary = primaryMedium;
  static const Color colorTextPrimary = textPrimary;
  static const Color colorTextSecondary = textSecondary;
  static const Color colorTextTertiary = textTertiary;
  
  static const Color borderColor = Color(0xFF1e293b); // slate-800
  static const Color hoverColor = Color(0xFF334155); // slate-700

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: accentCyan,
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0f172a),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'SpaceGrotesk',
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'SpaceGrotesk',
      ),
      displayMedium: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'SpaceGrotesk',
      ),
      displaySmall: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'SpaceGrotesk',
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'SpaceGrotesk',
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        fontFamily: 'Poppins',
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textTertiary,
        fontFamily: 'Poppins',
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primaryLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accentCyan, width: 2),
      ),
    ),
  );

  // Gradient definitions
  static const LinearGradient cyanToBlue = LinearGradient(
    colors: [accentCyan, accentBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [Color(0xFFf093fb), Color(0xFFf5576c)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanGradient = LinearGradient(
    colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
