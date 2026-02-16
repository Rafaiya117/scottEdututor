import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showViewUserDetailsPopup(BuildContext context, {
  required String name,
  required String email,
  required String role,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.all(24.w),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'View user Details',
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.h),

              // Teacher Name Section
              _buildDetailItem('Teacher Name', name),
              
              // Email Section
              _buildDetailItem('Email', email),
              
              // Roles Section
              _buildDetailItem('Roles', role, showDivider: false),
              
              SizedBox(height: 8.h),
            ],
          ),
        ),
      );
    },
  );
}

// Helper widget to build the labeled rows with dividers
Widget _buildDetailItem(String label, String value, {bool showDivider = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13.sp,
          color: const Color(0xFF9098A1), // Soft grey color from image
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 6.h),
      Text(
        value,
        style: GoogleFonts.inter(
          fontSize: 15.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      if (showDivider) ...[
        SizedBox(height: 12.h),
        const Divider(
          color: Color(0xFFDDEBFF), // Light blue divider from image
          thickness: 1,
        ),
        SizedBox(height: 12.h),
      ],
    ],
  );
}