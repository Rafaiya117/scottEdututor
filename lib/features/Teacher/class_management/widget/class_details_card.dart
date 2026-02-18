import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/costom_course_row.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/widget/add_student_popup.dart';

class ClassCard extends StatelessWidget {
  final String id;
  final String title;
  final String subject;
  final String description;
  final String enrolledCount;
  final String progress;
  final String createdDate;
  //final VoidCallback onAddStudents;

  const ClassCard({
    super.key,
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.enrolledCount,
    required this.progress,
    required this.createdDate,
    //required this.onAddStudents,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 18.sp, color: const Color(0xFFC5A368)),
              SizedBox(width: 8.w),
              Text(
                subject,
                style: GoogleFonts.poppins(fontSize: 14.sp, color: const Color(0xFF4A4A4A)),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: GoogleFonts.poppins(fontSize: 14.sp, color: const Color(0xFF4A4A4A)),
          ),
          SizedBox(height: 20.h),
          buildInfoRow('Students Enrolled', enrolledCount),
          SizedBox(height: 12.h),
          buildInfoRow('Average Progress', progress),
          SizedBox(height: 12.h),
          buildInfoRow('Created', createdDate),
          SizedBox(height: 24.h),
          const Divider(color: Color(0xFFEEEEEE), thickness: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              ElevatedButton(
                onPressed:() =>showAddStudentPopup(context),
                //onPressed: onAddStudents,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC5A368),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text(
                  'Add Students',
                  style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Passing the ID via extra or query params
                  context.push('/class_management_view_more', extra: id);
                },
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1A1A1A),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}