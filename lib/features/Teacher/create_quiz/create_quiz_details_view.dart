import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_provider.dart';

class QuizDetailView extends ConsumerWidget {
  final int quizIndex;
  const QuizDetailView({super.key, required this.quizIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider).quizzes[quizIndex];

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 45.h, left: 7.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
                SizedBox(width: 80.w),
                Text(
                  'Quiz Creator',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Dark Header Section with all fields from the image
            _buildQuizHeaderInfo(quiz),
            SizedBox(height: 10.h),
            _buildAddQuestionButton(ref),
            SizedBox(height: 20.h),
            
            // 2. The White Card Sheet
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  ...quiz.questions.asMap().entries.map((entry) {
                    return _buildQuestionCard(entry.key + 1, entry.value, ref);
                  }).toList(),
                  
                  if (quiz.questions.isEmpty)
                    SizedBox(height: 100.h, child: Center(child: Text("No questions added."))),

                  SizedBox(height: 20.h),
                  _buildFooterButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Header Section (Dark Part) ---
  Widget _buildQuizHeaderInfo(QuizModel quiz) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quiz Details', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 12.h),
          _buildDisabledField('Quiz Name', quiz.quizName),
          _buildDisabledField('Course', quiz.courseName),
          _buildDisabledField('Class', quiz.className),
          
          // New Missing Fields from iPhone 16 - 87.jpg
          _buildDisabledField('Select date and time', '2024-10-24 10:00 AM', icon: Icons.access_time),
          _buildDisabledField('Quiz time limit', '30 Minutes', icon: Icons.access_time),
          _buildDisabledField('Number of questions:', quiz.totalQuestions),
        ],
      ),
    );
  }

  Widget _buildDisabledField(String label, String value, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12.sp)),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: GoogleFonts.poppins(color: Colors.white)),
              if (icon != null) Icon(icon, color: Colors.white70, size: 18.sp),
            ],
          ),
        ),
      ],
    );
  }

  // --- White Card Section (Question Blocks) ---
  Widget _buildQuestionCard(int index, QuestionModel question, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Question $index", 
              style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            const Icon(Icons.delete_outline, color: Colors.red),
          ],
        ),
        SizedBox(height: 10.h),
        _buildTextField("Enter Your Qus", initialValue: question.questionText),
        SizedBox(height: 16.h),
        Text("Answer Options", style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 10.h),
        ...List.generate(4, (i) => 
          _buildOptionField(i, question.options[i], i == question.correctOptionIndex)
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: _buildPointsDropdown(question.points)),
            SizedBox(width: 16.w),
            Expanded(child: _buildCorrectAnswerField(
              initialValue: question.options.isNotEmpty ? question.options[question.correctOptionIndex] : ""
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Divider(color: Colors.grey.shade200, thickness: 1),
        ),
      ],
    );
  }

  Widget _buildOptionField(int index, String value, bool isSelected) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? const Color(0xFF0052CC) : Colors.grey,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              value.isEmpty ? "Option ${index + 1}" : value,
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {String? initialValue}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black12),
      ),
      child: TextFormField(
        initialValue: initialValue,
        style: GoogleFonts.poppins(fontSize: 13.sp),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAddQuestionButton(WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          onPressed: () => ref.read(quizProvider.notifier).addBlankQuestion(quizIndex),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4AF37),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
          child: Text('Add Questions', style: GoogleFonts.poppins(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => context.pop(),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
            child: Text("Cancel", style: GoogleFonts.poppins(color: Colors.black)),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF333333),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            child: Text("Save", style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildPointsDropdown(int points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Points", style: GoogleFonts.poppins(fontSize: 12.sp)),
        SizedBox(height: 4.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.black12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: points,
              isExpanded: true,
              items: [5, 10, 15, 20].map((int val) => DropdownMenuItem(
                value: val, 
                child: Text("$val", style: GoogleFonts.poppins(fontSize: 13.sp))
              )).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCorrectAnswerField({String? initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Correct Answer", style: GoogleFonts.poppins(fontSize: 12.sp)),
        SizedBox(height: 4.h),
        _buildTextField("", initialValue: initialValue),
      ],
    );
  }
}