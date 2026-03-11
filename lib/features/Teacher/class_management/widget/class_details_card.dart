import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:scoctt_edututo/core/componets/costom_course_row.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/widget/add_student_popup.dart';

class ClassCard extends ConsumerWidget {
  final ClassInfo classData; 
  const ClassCard({super.key, required this.classData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 380.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            classData.title,
            style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1A1A1A)),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 18.sp, color: const Color(0xFFC5A368)),
              SizedBox(width: 8.w),
              Text(classData.subject, style: GoogleFonts.poppins(fontSize: 14.sp, color: const Color(0xFF4A4A4A))),
            ],
          ),
          SizedBox(height: 12.h),
          Text(classData.description, style: GoogleFonts.poppins(fontSize: 14.sp, color: const Color(0xFF1A1A1A))),
          SizedBox(height: 20.h),
          
          _buildInfoRow('Students Enrolled', classData.enrolledCount),
          SizedBox(height: 12.h),
          _buildInfoRow('Average Progress', classData.progress),
          SizedBox(height: 12.h),
          _buildInfoRow('Created', classData.createdDate),
          
          const Divider(height: 40, color: Color(0xFFEEEEEE)),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => showAddStudentPopup(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC5A368),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: const Text('Add Students', style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              TextButton(
                // Pass the classId as part of the path now
                onPressed: () => context.push('/class_management_view_more/${classData.id}'),
                child: const Text(
                  'View Details', 
                  style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF1A1A1A)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F4EA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label, 
            style: GoogleFonts.poppins(fontSize: 14.sp, color: const Color(0xFF4A4A4A)),
          ),
          SizedBox(height: 4.h),
          Text(
            value, 
            style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF1A1A1A)),
          ),
        ],
      ),
    );
  }
}