import 'package:flutter/material.dart';

/// App theme configuration for light and dark modes
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Light theme colors
  static const Color _lightPrimaryColor = Color(0xFF2196F3);
  static const Color _lightSecondaryColor = Color(0xFF03DAC6);
  static const Color _lightBackgroundColor = Color(0xFFF5F5F5);
  static const Color _lightSurfaceColor = Colors.white;
  static const Color _lightErrorColor = Color(0xFFB00020);
  static const Color _lightTextColor = Color(0xFF121212);
  static const Color _lightIconColor = Color(0xFF555555);
  static const Color _lightDividerColor = Color(0xFFDDDDDD);
  static const Color _lightSentMessageColor = Color(0xFFE3F2FD);
  static const Color _lightReceivedMessageColor = Color(0xFF2196F3);

  // Dark theme colors
  static const Color _darkPrimaryColor = Color(0xFF2196F3);
  static const Color _darkSecondaryColor = Color(0xFF03DAC6);
  static const Color _darkBackgroundColor = Color(0xFF121212);
  static const Color _darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color _darkErrorColor = Color(0xFFCF6679);
  static const Color _darkTextColor = Color(0xFFEEEEEE);
  static const Color _darkIconColor = Color(0xFFAAAAAA);
  static const Color _darkDividerColor = Color(0xFF333333);
  static const Color _darkSentMessageColor = Color(0xFF0D47A1);
  static const Color _darkReceivedMessageColor = Color(0xFF1565C0);

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      background: _lightBackgroundColor,
      surface: _lightSurfaceColor,
      error: _lightErrorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: _lightTextColor,
      onSurface: _lightTextColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: _lightSurfaceColor,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: _lightDividerColor,
      thickness: 1,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: _lightTextColor),
      displayMedium: TextStyle(color: _lightTextColor),
      displaySmall: TextStyle(color: _lightTextColor),
      headlineLarge: TextStyle(color: _lightTextColor),
      headlineMedium: TextStyle(color: _lightTextColor),
      headlineSmall: TextStyle(color: _lightTextColor),
      titleLarge: TextStyle(color: _lightTextColor),
      titleMedium: TextStyle(color: _lightTextColor),
      titleSmall: TextStyle(color: _lightTextColor),
      bodyLarge: TextStyle(color: _lightTextColor),
      bodyMedium: TextStyle(color: _lightTextColor),
      bodySmall: TextStyle(color: _lightTextColor),
      labelLarge: TextStyle(color: _lightTextColor),
      labelMedium: TextStyle(color: _lightTextColor),
      labelSmall: TextStyle(color: _lightTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _lightPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _lightErrorColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _lightPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _lightPrimaryColor,
        side: const BorderSide(color: _lightPrimaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      background: _darkBackgroundColor,
      surface: _darkSurfaceColor,
      error: _darkErrorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: _darkTextColor,
      onSurface: _darkTextColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkSurfaceColor,
      foregroundColor: _darkTextColor,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: _darkSurfaceColor,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: _darkDividerColor,
      thickness: 1,
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: _darkTextColor),
      displayMedium: TextStyle(color: _darkTextColor),
      displaySmall: TextStyle(color: _darkTextColor),
      headlineLarge: TextStyle(color: _darkTextColor),
      headlineMedium: TextStyle(color: _darkTextColor),
      headlineSmall: TextStyle(color: _darkTextColor),
      titleLarge: TextStyle(color: _darkTextColor),
      titleMedium: TextStyle(color: _darkTextColor),
      titleSmall: TextStyle(color: _darkTextColor),
      bodyLarge: TextStyle(color: _darkTextColor),
      bodyMedium: TextStyle(color: _darkTextColor),
      bodySmall: TextStyle(color: _darkTextColor),
      labelLarge: TextStyle(color: _darkTextColor),
      labelMedium: TextStyle(color: _darkTextColor),
      labelSmall: TextStyle(color: _darkTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _darkErrorColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkPrimaryColor,
        side: const BorderSide(color: _darkPrimaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );

  // Chat message bubble colors
  static Color getSentMessageColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? _lightSentMessageColor
        : _darkSentMessageColor;
  }

  static Color getReceivedMessageColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? _lightReceivedMessageColor
        : _darkReceivedMessageColor;
  }
}
