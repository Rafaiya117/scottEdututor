import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/componets/custom_subject_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_provider.dart';
import 'package:scoctt_edututo/features/Teacher/courses/widget_create_course/create_course_popup.dart';

class CourseView extends ConsumerWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Courses>>(
      future: ref.read(courseProvider).fetchCourses(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final courses = snapshot.data ?? [];

        return BackgroundTemplate(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.h),
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
                        SizedBox(width: 40.w),
                        Text(
                          'Course Management',
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GoldButton(
                    width: 200.w,
                    height: 37.h,
                    text: 'Create Course',
                    onPressed: () => showCreateCoursePopup(context),
                  ),
                ),
                SizedBox(height: 20.h),
                ...courses.map((course) {
                  final unitCount = course.chapters.length;
                  int lessonCount = 0;
                  for (var chapter in course.chapters) {
                    if (chapter['topics'] != null) {
                      lessonCount += (chapter['topics'] as List).length;
                    }
                  }
                  return SubjectCard(
                    title: course.title,
                    description: '',
                    unitCount: unitCount,
                    lessonCount: lessonCount,
                    onTap: () => context.push('/courses_details/${course.id}'),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}