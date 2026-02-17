import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String description;
  final int unitCount;
  final int lessonCount;
  final VoidCallback? onTap;

  const SubjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.unitCount,
    required this.lessonCount,
    this.onTap,
  });

  @override
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF9F4E8);
    const primaryTextColor = Color(0xFF1A2A3A);
    const secondaryTextColor = Color(0xFF5A6A7A);
    const accentColor = Color(0xFFD4B483);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row( // Added Row to align content and arrow horizontally
          crossAxisAlignment: CrossAxisAlignment.center, // Centers the arrow vertically
          children: [
            Expanded( // Expanded ensures the text content takes up available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: secondaryTextColor,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildStat(Icons.track_changes, '$unitCount Unit', accentColor, secondaryTextColor),
                      const SizedBox(width: 24),
                      _buildStat(Icons.track_changes, '$lessonCount lessons', accentColor, secondaryTextColor),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16), // Space between content and arrow
            const Icon(Icons.arrow_forward_ios, size: 16, color: accentColor),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(IconData icon, String label, Color iconColor, Color textColor) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: textColor),
        ),
      ],
    );
  }
}