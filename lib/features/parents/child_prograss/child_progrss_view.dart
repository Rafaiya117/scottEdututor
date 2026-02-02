import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:scoctt_edututo/core/componets/info_card.dart';
import 'package:scoctt_edututo/core/componets/reusable_card.dart';
import 'package:scoctt_edututo/core/componets/summary_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/parents/child_prograss/child_prograss_provider.dart';

class ChildProgrssView extends ConsumerWidget {
  const ChildProgrssView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get controller from provider
    final controller = ref.watch(childProgressProvider);
    final state = controller.getChildProgress();

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.h, left: 8.0.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                    ),
                    SizedBox(width: 280.w),
                    GestureDetector(
                      onTap: () {
                        //context.push('/profile');
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile_image3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.h),
      body: Column(
        children: [
          // Summary Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SummaryCard(
                value: '${state.totalScore}%',
                label: 'Total Score',
                color: const Color(0xFFCACACA),
              ),
              SummaryCard(
                value: '${state.enrolledCourses}',
                label: 'Enroll Courses',
                color: const Color(0xFFE7FFEC),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Recent Quiz Results
          ReusableCard(
            title: 'Recent Quiz Results',
            children: state.recentQuizzes
              .map(
                (quiz) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: InfoRowCard(
                    title: quiz.title,
                    subtitle: quiz.score,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                  ),
                ),
              )
            .toList(),
          ),
          SizedBox(height: 20.h),

          // Enrolled Courses
          ReusableCard(
            title: 'Enrolled Courses',
              children: state.courses
                .map(
                  (course) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: InfoRowCard(
                      title: course.title,
                      subtitle: course.lessons,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 5.h,
                      ),
                      trailing: TextButton(
                      onPressed: () {
                        context.push('/lesson_view/${course.id}');
                      },
                      child: Text(
                        'View Details',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0010E9),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            .toList(),
          ),
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Progress Score',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${state.progressPercent}%',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Flexible(
                        child: LinearProgressBar(
                          maxSteps: 100,
                          progressType: ProgressType.linear,
                          currentStep: state.progressPercent,
                          progressColor: Color(0xFFD0AD6B),
                          backgroundColor: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          minHeight: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
