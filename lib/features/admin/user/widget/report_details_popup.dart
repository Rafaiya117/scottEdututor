import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showReportDetailsPopup(BuildContext context, {
  required String studentName,
  required String email,
  required List<String> courses,
  required String grade,
  required String score,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Reports Summary',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.h),

              // Student Name
              _buildReportItem('Student Name', studentName),
              
              // Email
              _buildReportItem('Email', email),
              
              // Course Name (Chips)
              _buildCourseChips('Course Name', courses),
              
              // Grade
              _buildReportItem('Grade', grade),
              
              // Score
              _buildReportItem('Score', score, showDivider: false),
            ],
          ),
        ),
      );
    },
  );
}

// Helper for standard text items
Widget _buildReportItem(String label, String value, {bool showDivider = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13.sp,
          color: const Color(0xFF5A6B78), // Grey label
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 15.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (showDivider) _divider(),
    ],
  );
}

// Helper for the Algebra 1 tags/chips
Widget _buildCourseChips(String label, List<String> courses) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 13.sp,
          color: const Color(0xFF5A6B78),
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 8.h),
      Wrap(
        spacing: 8.w,
        children: courses.map((course) => Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9), // Very light green background
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            course,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: const Color(0xFF2E7D32), // Darker green text
              fontWeight: FontWeight.w500,
            ),
          ),
        )).toList(),
      ),
      _divider(),
    ],
  );
}

Widget _divider() {
  return Column(
    children: [
      SizedBox(height: 12.h),
      const Divider(color: Color(0xFFDDEBFF), thickness: 1), // Light blue divider
      SizedBox(height: 12.h),
    ],
  );
}