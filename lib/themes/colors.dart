// lib/themes/colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryOrange = Color.fromRGBO(
    252,
    195,
    70,
    1.0,
  ); // RGB(252, 195, 70)

  // Background Colors
  static const Color background = Color(0xFFF9FAFF); // RGB(249, 250, 255)

  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF); // White for cards

  // Text Colors
  static const Color textPrimary = Color(0xFF2D2D2D); // Dark gray for main text
  static const Color textSecondary = Color(
    0xFF757575,
  ); // Medium gray for secondary text
  static const Color textOnPrimary = Color(
    0xFFFFFFFF,
  ); // White text on primary color

  // Status Colors
  static const Color success = Color(0xFF4CAF50); // Green for success states
  static const Color error = Color(0xFFF44336); // Red for error states

  // Shadow Colors
  static const Color shadowLight = Color(0x1A000000); // 10% black
  static const Color shadowMedium = Color(0x33000000); // 20% black
  static const Color shadowDark = Color(0x4D000000); // 30% black
}
