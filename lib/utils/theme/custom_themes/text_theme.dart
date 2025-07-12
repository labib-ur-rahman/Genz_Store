import 'package:flutter/material.dart';

class SLTextTheme {
  SLTextTheme._();

  /// -- Light Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: const TextStyle().copyWith(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),

    titleLarge: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black),

    bodyLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodyMedium: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),

    labelLarge: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    labelMedium: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black),
  );

  /// -- Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),

    titleLarge: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),

    bodyLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodyMedium: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),

    labelLarge: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    labelMedium: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.white),
  );
}