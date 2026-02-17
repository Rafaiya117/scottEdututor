import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/costom_course_row.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class ClassManagementDetails extends ConsumerWidget {
  ClassManagementDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding:EdgeInsets.only(top: 45.h,left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 40.w,),
                    Text(
                      'Class Management',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  // Header Section
                  Text(
                    'Algebra II - Period 3',
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        size: 18.sp,
                        color: const Color(0xFFC5A368),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Algebra II',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color(0xFF4A4A4A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Master all Algebra II skills required for state standards',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: const Color(0xFF4A4A4A),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  buildInfoRow('Students Enrolled', '1'),
                  SizedBox(height: 12.h),
                  buildInfoRow('Average Progress', '67%'),
                  SizedBox(height: 12.h),
                  buildInfoRow('Created', '01/09/2024'),
                  SizedBox(height: 24.h),
                  const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                  SizedBox(height: 16.h),
        
                  // Action Buttons Section
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.push('/add_student');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC5A368),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add Students',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
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
            ),
            SizedBox(height: 20.h,),
            Container(
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
                  // Header Section
                  Text(
                    'Algebra II - Period 3',
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book_outlined,
                        size: 18.sp,
                        color: const Color(0xFFC5A368),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Algebra II',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color(0xFF4A4A4A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Master all Algebra II skills required for state standards',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: const Color(0xFF4A4A4A),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  buildInfoRow('Students Enrolled', '1'),
                  SizedBox(height: 12.h),
                  buildInfoRow('Average Progress', '67%'),
                  SizedBox(height: 12.h),
                  buildInfoRow('Created', '01/09/2024'),
                  SizedBox(height: 24.h),
                  const Divider(color: Color(0xFFEEEEEE), thickness: 1),
                  SizedBox(height: 16.h),
        
                  // Action Buttons Section
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC5A368),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add Students',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}