import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileField({
  required String label,
  required TextEditingController controller,
   bool? enabled,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: Colors.white70,
        ),
      ),
      TextField(
        controller: controller,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
        ),
      ),
      const Divider(color: Colors.white54, thickness: 1),
      SizedBox(height: 8.h),
    ],
  );
}
