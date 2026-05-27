import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0B0A0A);
  static const Color accent = Color(0xFFFF1E1E);
  static const Color surface = Color(0xFF121212);
  static const Color cardBackground = Color(0xFF1E1E1E);
  
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF757575);

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);

  static const Gradient darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A1A1A),
      Color(0xFF000000),
    ],
  );
}
