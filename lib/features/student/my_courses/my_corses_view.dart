import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_coureses_model.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_courses_controller.dart';


class CourseTableView extends ConsumerWidget {
  const CourseTableView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(MyCoursesController.courseProvider);

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
                        context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 90.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My COurses',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
      ),
      padding:EdgeInsets.symmetric(horizontal: 10.h, vertical: 34.w),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
              // Added SingleChildScrollView to prevent bottom overflow
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    ...courses.map((course) => _CourseRow(course: course)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFDBD8D8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [
          Flexible(flex: 3, child: Text('Course Name', style: GoogleFonts.figtree(color: Colors.white, fontWeight: FontWeight.bold))),
          SizedBox(width: 40.w,),
          Flexible(flex: 2, child: Text('Lesson', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          const SizedBox(width: 80),
        ],
      ),
    );
  }
}

class _CourseRow extends StatelessWidget {
  final CourseModel course;
  const _CourseRow({required this.course});

  @override
  Widget build(BuildContext context) {
    final isEnroll = course.status == CourseStatus.enrollNow;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: course.backgroundColor,
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded( 
            flex: 3,
            child: Text(
              course.name,
              style: GoogleFonts.figtree(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4A4441),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              course.lessons,
              style: GoogleFonts.figtree(color: Colors.grey, fontSize: 13),
            ),
          ),
          SizedBox( 
            width: 80,
            child: Text(
              isEnroll ? 'Enroll Now' : 'Learning',
              textAlign: TextAlign.end,
              style: GoogleFonts.figtree(
                color: isEnroll ? const Color(0xFF7CB342) : const Color(0xFF6B8AFF),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}