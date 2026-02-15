import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/admin/quizes/quiezes_model.dart';
import 'package:scoctt_edututo/features/admin/quizes/quizes_provider.dart';

class QuizView extends ConsumerWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzes = ref.watch(quizListProvider);

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
                    SizedBox(width: 80.w,),
                    Text(
                      'Quizzes',
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
      padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizzes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return QuizCardWidget(quizData: quizzes[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCardWidget extends StatelessWidget {
  final QuizModel quizData;
  const QuizCardWidget({super.key, required this.quizData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to QuizDetails or perform action
        context.push('/admin/quize_details'); 
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F2E9),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quizData.quizName,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A232E),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFFC5A059), size: 28),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildStatItem(quizData.totalPoints)),
                Expanded(child: _buildStatItem(quizData.totalQuestions)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildStatItem(quizData.className)),
                Expanded(child: _buildStatItem(quizData.courseName)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label) {
    return Row(
      children: [
        const Icon(Icons.track_changes_outlined, size: 20, color: Color(0xFFC5A059)),
        const SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.inter(color: const Color(0xFF5A6B78), fontSize: 14.sp),
        ),
      ],
    );
  }
}