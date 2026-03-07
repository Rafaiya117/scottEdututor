import 'package:flutter/material.dart';

enum CustomSnackType { success, error, warning }

class SnackStyle {
  final Color backgroundColor;
  final Color bottomBorderColor;
  final IconData icon;

  SnackStyle({
    required this.backgroundColor,
    required this.bottomBorderColor,
    required this.icon,
  });

  static SnackStyle getStyle(CustomSnackType type) {
    switch (type) {
      case CustomSnackType.success:
        return SnackStyle(
          backgroundColor: const Color(0xFFE9F5ED), 
          bottomBorderColor: const Color(0xFF388E3C), 
          icon: Icons.check_circle,
        );
      case CustomSnackType.error:
        return SnackStyle(
          backgroundColor: const Color(0xFFFDECEA), 
          bottomBorderColor: const Color(0xFFD32F2F), 
          icon: Icons.error,
        );
      case CustomSnackType.warning:
        return SnackStyle(
          backgroundColor: const Color(0xFFFFF4E5), 
          bottomBorderColor: const Color(0xFFFFA000), 
          icon: Icons.warning,
        );
    }
  }
}