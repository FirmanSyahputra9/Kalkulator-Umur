import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6366F1);
  static const secondary = Color(0xFFA5B4FC);
  static const background = Color(0xFFF8FAFC);
  static const drawer = Color(0xFFE0E7FF);
  static const cardBorder = Color(0xFFE2E8F0);
}

class AppStyles {
  static final gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primary.withOpacity(0.1),
        AppColors.secondary.withOpacity(0.2),
      ],
    ),
  );

  static final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(
      color: AppColors.cardBorder,
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static const drawerWidth = 300.0;
}