import 'package:flutter/material.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';

void showCustomSnackBar(BuildContext context, String message, CustomSnackType type) {
  final style = SnackStyle.getStyle(type);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent, 
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            bottom: BorderSide(color: style.bottomBorderColor, width: 6),
          ),
        ),
        child: Row(
          children: [
            Icon(style.icon, color: style.bottomBorderColor, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Color(0xFF1E1E1E), // Dark text for readability
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}