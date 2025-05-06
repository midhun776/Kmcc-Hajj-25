import 'package:flutter/material.dart';

class AppConstants {
  // Basic Colors
  static const Color primaryBlue = Color(0xFF1A737E);
  static const Color primaryOrange = Color(0xFFF29242);
  static const Color lightBlue = Color(0xFF86FFFF);
  static const Color lightOrange = Color(0xFFFFC757);
  static const Color black = Color(0xFF000000); // Black
  static const Color white = Color(0xFFFFFFFF); // White

  // Gradients
  static const Gradient splashGradient = LinearGradient(
    colors: [
      lightBlue, // White
      lightOrange, // Pink
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}