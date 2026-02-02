import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const SummaryCard({
    super.key,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166.w,
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF000000),
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
