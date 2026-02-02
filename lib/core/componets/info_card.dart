import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoRowCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing; 
  final EdgeInsetsGeometry padding;

  const InfoRowCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFD4B579),
        ),
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}