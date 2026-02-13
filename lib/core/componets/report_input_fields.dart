import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildReportRow(String label, String value) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 12.h),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.blue.withOpacity(0.2))),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.figtree(color: Colors.grey, fontSize: 13.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: GoogleFonts.figtree(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}