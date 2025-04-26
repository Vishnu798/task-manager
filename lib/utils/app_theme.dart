import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF5C6BC0);
  static const Color primaryDarkColor = Color(0xFF3949AB);
  static const Color backgroundColor = Color(0xFFF5F7FF);
  static const Color backgroundDarkColor = Color(0xFF121212);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: 'Poppins',

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black26,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'Poppins',
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return Colors.grey.shade400;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor.withValues(alpha: 0.5);
        }
        return Colors.grey.shade300;
      }),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: backgroundDarkColor,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryDarkColor,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Poppins',

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryDarkColor,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2C2C2C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryDarkColor, width: 2),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    cardTheme: CardTheme(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black45,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: primaryDarkColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'Poppins',
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDarkColor,
      foregroundColor: Colors.white,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor;
        }
        return Colors.grey.shade600;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryDarkColor.withOpacity(0.5);
        }
        return Colors.grey.shade700;
      }),
    ),

    iconTheme: IconThemeData(color: Colors.white),
  );
}
