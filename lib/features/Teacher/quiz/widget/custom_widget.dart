import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_controller.dart';

Widget buildFileListSection(List<PlatformFile> files, QuizController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...files.map((file) => buildFileItem(file, controller)),
          SizedBox(width: 12.w),
          buildAddMoreButton(onTap: controller.pickFiles),
        ],
      ),
    );
  }
  
  Widget buildAddMoreButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Container(
          width: 110.w,
          height: 90.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, color: Colors.white70, size: 24.sp),
              Text('Add file', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 10.sp)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFileItem(PlatformFile file, QuizController controller) {
    return Container(
      width: 110.w, height: 90.h,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white24),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 28.sp),
                SizedBox(height: 4.h),
                Text(
                  file.name, 
                  maxLines: 1, 
                  overflow: TextOverflow.ellipsis, 
                  style: GoogleFonts.poppins(
                    color: Colors.white, 
                    fontSize: 10.sp
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0, 
            child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.white70, 
                size: 18.sp
              ),
              onPressed: () => controller.removeFile(file),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyState({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            children: [
              Icon(Icons.note_add_outlined, size: 50.sp, color: Colors.white70),
              SizedBox(height: 12.h),
              Text(
                'No questions yet. Click "Add Question" to start.',
                style: GoogleFonts.poppins(color: Colors.white60, fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDashedEmptyState() {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: [
            Icon(Icons.note_add_outlined, size: 50.sp, color: Colors.white),
            SizedBox(height: 12.h),
            Text(
              'No questions yet. Click "Add Question" to start.',
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGenerateButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37).withOpacity(0.8), // Goldish color from image
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.auto_awesome, size: 16.sp, color: Colors.white),
          SizedBox(width: 4.w),
          Text(
            'Generate Quiz',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFieldLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
    );
  }

  // Widget buildInputField({required String hint, bool isDropdown = false, IconData? suffixIcon}) {
  //   return TextField(
  //     style: const TextStyle(color: Colors.white),
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp),
  //       suffixIcon: Icon(
  //         isDropdown ? Icons.keyboard_arrow_down : suffixIcon,
  //         color: Colors.grey,
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.r),
  //         borderSide: const BorderSide(color: Colors.grey, width: 1),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.r),
  //         borderSide: const BorderSide(color: Colors.white, width: 1),
  //       ),
  //       contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //     ),
  //   );
  // }

  Widget buildInputField({
  required String hint,
  bool isDropdown = false,
  IconData? suffixIcon,
  TextEditingController? controller,
}) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp),
      suffixIcon: Icon(
        isDropdown ? Icons.keyboard_arrow_down : suffixIcon,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.white, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
  );
}

  class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()..addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height), 
      Radius.circular(12.r)
    ));

    double dashWidth = 10.0;
    double dashSpace = 8.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}