import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showViewStudentDetailsPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header
                Text(
                  'View Student Details',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 24.h),

                // 2. Info Sections
                _buildDetailItem('Student ID', '0001'),
                _buildDetailItem('Student Name', 'Emma Jonson'),
                _buildDetailItem('Email', 'emmajohnson@email.com'),

                // 3. Course Section
                _buildSectionLabel('Course Name'),
                SizedBox(height: 8.h),
                _buildCourseProgress('Algebra 1', 0.85),
                SizedBox(height: 12.h),
                _buildCourseProgress('Algebra 2', 0.85),
                
                const Divider(color: Color(0xFFDDEBFF), thickness: 1),
                SizedBox(height: 16.h),

                // 4. Grade & Score
                _buildDetailItem('Grade', 'Algebra I - Period 1'),
                _buildDetailItem('Score', '85', showDivider: false),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// --- Helper Widgets ---

Widget _buildDetailItem(String label, String value, {bool showDivider = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: const Color(0xFF8A94A6), // Muted grey label
        ),
      ),
      SizedBox(height: 4.h),
      Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      if (showDivider) ...[
        SizedBox(height: 12.h),
        const Divider(color: Color(0xFFDDEBFF), thickness: 1),
        SizedBox(height: 16.h),
      ],
    ],
  );
}

Widget _buildSectionLabel(String label) {
  return Text(
    label,
    style: GoogleFonts.poppins(
      fontSize: 14.sp,
      color: const Color(0xFF8A94A6),
    ),
  );
}

Widget _buildCourseProgress(String courseName, double progress) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Text(
          courseName,
          style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        flex: 3,
        child: Row(
          children: [
            Text(
              '${(progress * 100).toInt()}%',
              style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8.h,
                  backgroundColor: const Color(0xFFE0E0E0),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB4D333)), // Lime green
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}