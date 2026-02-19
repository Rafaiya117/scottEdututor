import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_provider.dart';


class QuizDetailView extends ConsumerWidget {
  final int quizIndex;
  const QuizDetailView({super.key, required this.quizIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    final quizState = ref.watch(quizProvider);
    if (quizIndex >= quizState.quizzes.length) {
      return const Scaffold(body: Center(child: Text("Quiz not found")));
    }
    final quiz = quizState.quizzes[quizIndex];
     final selectedCourse = ref.watch(selectedCourseProvider);
     final selectedClass = ref.watch(selectedClassProvider);
    return BackgroundTemplate(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Quiz Creator',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildQuizHeaderInfo(context, ref, selectedCourse, selectedClass),
            //_buildQuizHeaderInfo(),
            SizedBox(height: 15.h),
            _buildAddQuestionButton(ref),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
              ),
              child: Column(
                children: [
                  if (quiz.questions.isNotEmpty)
                    ...quiz.questions.asMap().entries.map((entry) {
                      return _buildQuestionCard(entry.key + 1, entry.value);
                    }).toList()
                  else ...[
                    _buildQuestionCard(
                      1,
                      QuestionModel(
                        questionText: "What is the capital of France?",
                        options: ["Berlin", "Madrid", "Paris", "Rome"],
                        correctOptionIndex: 2,
                        points: 10,
                      ),
                    ),
                    // Display Sample Question 2
                    _buildQuestionCard(
                      2,
                      QuestionModel(
                        questionText:"Which planet is known as the Red Planet?",
                        options: ["Earth", "Mars", "Jupiter", "Saturn"],
                        correctOptionIndex: 1,
                        points: 10,
                      ),
                    ),
                  ],
                  //   Padding(
                  //     padding: EdgeInsets.symmetric(vertical: 40.h),
                  //     child: Text("No questions added yet.",
                  //   style: GoogleFonts.poppins(color: Colors.grey)),
                  // ),
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


  // Widget _buildQuizHeaderInfo() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 2.w),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _buildLabel('Quiz Name'),
  //         _buildInputField('e.g., Linear Equations Quiz'),
  //         _buildLabel('Course'),
  //         _buildDropdownField('Select course...'),
  //         _buildLabel('Class'),
  //         _buildDropdownField('All classes...'),
  //         _buildLabel('Select date and time'),
  //         _buildInputField('Select your date and time', suffixIcon: Icons.access_time_outlined),
  //         _buildLabel('Quiz time limit'),
  //         _buildInputField('Select your time', suffixIcon: Icons.access_time_outlined),
  //         _buildLabel('Number of questions:'),
  //         _buildInputField('Enter the number'),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildQuizHeaderInfo(BuildContext context, WidgetRef ref, String course, String className) {
    final selectedCourse = ref.watch(selectedCourseProvider);
    final selectedClass = ref.watch(selectedClassProvider);
    final controller = ref.read(quizProvider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Quiz Name'),
          _buildInputField('e.g., Linear Equations Quiz'),
          
          _buildLabel('Course'),
          _buildDropdownField(
          currentValue: selectedCourse,
          items: ['Mathematics', 'Physics', 'Chemistry', 'Biology'],
          onChanged: (val) => ref.read(selectedCourseProvider.notifier).state = val!,
        ),
          
          _buildLabel('Class'),
          _buildDropdownField(
          currentValue: selectedClass,
          items: ['Class 1', 'Class 2', 'Class 3', 'Class 4'],
          onChanged: (val) => ref.read(selectedClassProvider.notifier).state = val!,
        ),
          
          _buildLabel('Select date and time'),
          _buildInputField(
            'Select your date',
            suffixIcon: Icons.calendar_today,
            controller: controller.dateController, 
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              if (date != null) {
                controller.dateController.text ="${date.day}/${date.month}/${date.year}"; 
              }
            },
          ),
          _buildLabel('Quiz time limit'),
          _buildInputField(
            'Select your time',
            suffixIcon: Icons.access_time_outlined,
            controller: controller.timeController, 
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                controller.timeController.text = time.format(context); 
              }
            },
          ),
          _buildLabel('Number of questions:'),
          _buildInputField('Enter the number'),
        ],
      ),
    );
  }

  Widget _buildAddQuestionButton(WidgetRef ref) {
  return Padding(
    // Match the horizontal padding used in _buildQuizHeaderInfo exactly
    padding: EdgeInsets.symmetric(horizontal: 2.w), 
    child: Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => ref.read(quizProvider.notifier).addBlankQuestion(quizIndex),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFC9A66B),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            'Add Questions',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}


  Widget _buildQuestionCard(int index, QuestionModel question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Question $index", style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
            const Icon(Icons.delete_outline, color: Colors.red, size: 20),
          ],
        ),
        SizedBox(height: 8.h),
        _buildWhiteBoxField(question.questionText.isEmpty ? "Enter Your Qus" : question.questionText),
        SizedBox(height: 12.h),
        Text("Answer Options", style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500)),
        ...question.options.asMap().entries.map((opt) => 
           _buildOptionItem(opt.value.isEmpty ? "Option ${opt.key + 1}" : opt.value, opt.key == question.correctOptionIndex)
        ).toList(),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: _buildPointSelector("Points", question.points.toString())),
            SizedBox(width: 15.w),
            Expanded(child: _buildPointSelector("Correct Answer", "")),
          ],
        ),
        const Divider(height: 40),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h, top: 10.h),
      child: Text(text, style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp)),
    );
  }

  // Widget _buildInputField(String hint, {IconData? suffixIcon}) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 5.h),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12.r),
  //       border: Border.all(color: Colors.white38),
  //     ),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         hintText: hint,
  //         hintStyle: GoogleFonts.poppins(color: Colors.white60, fontSize: 13.sp),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
  //         border: InputBorder.none,
  //         suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.white60, size: 20.sp) : null,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildInputField(String hint, {IconData? suffixIcon, VoidCallback? onTap, TextEditingController? controller}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.white38),
    ),
    child: TextField(
      controller: controller, // Added this
      readOnly: onTap != null,
      onTap: onTap,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.white60, fontSize: 13.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        border: InputBorder.none,
        suffixIcon: suffixIcon != null 
            ? Icon(suffixIcon, color: Colors.white60, size: 20.sp) 
            : null,
      ),
    ),
  );
}

Widget _buildDropdownField({
  required String currentValue,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.white38),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: items.contains(currentValue) ? currentValue : null,
        hint: Text(currentValue, style: GoogleFonts.poppins(color: Colors.white60, fontSize: 13.sp)),
        isExpanded: true,
        alignment: AlignmentDirectional.centerStart, 
        menuMaxHeight: 300.h, 
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white60, size: 20.sp),
        dropdownColor: const Color(0xFF4A463F),
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 13.sp),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: GoogleFonts.poppins(color: Colors.white)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
  // --- Add Question Button ---
  // Widget _buildAddQuestionButton() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20.w),
  //     child: Align(
  //       alignment: Alignment.centerRight,
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: const Color(0xFFC9A66B), // Muted gold color from image
  //           borderRadius: BorderRadius.circular(8.r),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
  //         child: Text('Add Questions', 
  //           style: GoogleFonts.poppins(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w500)),
  //       ),
  //     ),
  //   );
  // }

  // // --- Question Card ---
  // Widget _buildQuestionCard(int index) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 20.h),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text("Question $index", style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500)),
  //             Icon(Icons.delete_outline, color: Colors.red.shade400, size: 20.sp),
  //           ],
  //         ),
  //         SizedBox(height: 8.h),
  //         _buildWhiteBoxField("Enter Your Qus"),
  //         SizedBox(height: 12.h),
  //         Text("Answer Options", style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500)),
  //         SizedBox(height: 8.h),
  //         _buildOptionItem("Option 1", false),
  //         _buildOptionItem("Option 2", false),
  //         _buildOptionItem("Option 3", true), // Selected in image
  //         _buildOptionItem("Option 4", false),
  //         SizedBox(height: 12.h),
  //         Row(
  //           children: [
  //             Expanded(child: _buildPointSelector("Points", "10")),
  //             SizedBox(width: 15.w),
  //             Expanded(child: _buildPointSelector("Correct Answer", "")),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildWhiteBoxField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.grey.shade400, fontSize: 12.sp),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildOptionItem(String hint, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? const Color(0xFF1A56BE) : Colors.black54,
            size: 18.sp,
          ),
          SizedBox(width: 10.w),
          Text(hint, style: GoogleFonts.poppins(color: Colors.grey.shade400, fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildPointSelector(String label, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 12.sp)),
        SizedBox(height: 5.h),
        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(val, style: GoogleFonts.poppins(fontSize: 12.sp)),
              if (label == "Points") const Icon(Icons.unfold_more, size: 16, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black26),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Text("Cancel", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500)),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B3B3B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: Text("Save", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ),
      ],
    );
  }
}