import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/componets/custom_subject_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/courses/widget_create_course/create_course_popup.dart';

class CourseView extends ConsumerWidget{
  CourseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    SizedBox(width: 40.w,),
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
      padding:EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
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
            SubjectCard(
              title: 'Algebra II',
              description:'Advanced algebra concepts including polynomials, exponentials, and logarithms',
              unitCount: 2,
              lessonCount: 4,
              onTap: () => context.push('/courses_details/alg2'),
            ),
            const SizedBox(height: 16),
            SubjectCard(
              title: 'English Literature 9',
              description:'Exploring shapes, sizes, and the properties of space.',
              unitCount: 3,
              lessonCount: 12,
              onTap: () => print('Geometry clicked!'),
            ),
            const SizedBox(height: 16),
            SubjectCard(
              title: 'Geometry',
              description:'Exploring shapes, sizes, and the properties of space.',
              unitCount: 3,
              lessonCount: 12,
              onTap: () => print('Geometry clicked!'),
            ),
          ],
        ),
      ),
    );
  }
}