import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/admin/all_courses/lesson_controller.dart';
import 'package:scoctt_edututo/features/admin/all_courses/lesson_model.dart';

class LessonView extends ConsumerWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Controller logic: Watching the data
    final syllabus = ref.watch(lessonProvider);

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'Lessons',
                      style: GoogleFonts.inter(
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSyllabusContainer(syllabus), 
          ],
        ),
      ),
    );
  }

  Widget _buildSyllabusContainer(CourseSyllabus syllabus) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              syllabus.courseName,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A232E),
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(
              children: syllabus.units.map((unit) => _buildUnitItem(unit)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitItem(LessonUnit unit) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            unit.unitTitle,
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A232E),
            ),
          ),
          SizedBox(height: 8.h),
          ...unit.lessons.map((lesson) => Padding(
            padding: EdgeInsets.only(left: 40.w, bottom: 8.h),
            child: Text(
              lesson,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: const Color(0xFF5A6B78).withOpacity(0.7),
              ),
            ),
          )),
        ],
      ),
    );
  }
}