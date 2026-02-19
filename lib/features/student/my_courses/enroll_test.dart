import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_courses_provider.dart';
import 'package:scoctt_edututo/features/student/my_courses/widget/report_summery_popup.dart';

class EnrollTest extends ConsumerWidget {
  EnrollTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(quizProvider);

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
                padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'Enroll Test Quiz',
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
      padding:EdgeInsets.symmetric(horizontal: 12.w, vertical: 32.h),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                for (int i = 0; i < questions.length; i++) ...[
                  _buildQuestionSection(context, ref, i, questions[i]),
                  const SizedBox(height: 20),
                ],
                const SizedBox(height: 10),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildQuestionSection(BuildContext context, WidgetRef ref, int index, question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        const SizedBox(height: 15),
        const Text("Answer Options", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        
        ...List.generate(question.options.length, (optIndex) => 
          _buildOptionTile(
            question.options[optIndex], 
            optIndex, 
            question.selectedOptionIndex, 
            (val) => ref.read(quizProvider.notifier).updateSelection(index, val)
          )
        ),
        
        const SizedBox(height: 15),
        const Text("Points", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          onChanged: (val) => ref.read(quizProvider.notifier).updatePoints(index, int.tryParse(val) ?? 0),
          decoration: InputDecoration(
            hintText: question.points.toString(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE0C9A6))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE0C9A6))),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionTile(String text, int value, int? groupValue, ValueChanged<int?> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0C9A6)),
        color: const Color(0xFFFAFAFA),
      ),
      child: RadioListTile<int>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        activeColor: Colors.blue,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _customButton(context,"Cancel", isOutlined: true)),
        const SizedBox(width: 20),
        Expanded(child: _customButton(context,"Submit", isOutlined: false)),
      ],
    );
  }

 Widget _customButton(BuildContext context, String text, {required bool isOutlined}) {
    return isOutlined 
      ? OutlinedButton(
          onPressed: () {
            context.pop();
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Colors.grey),
          ),
          child: Text(text, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        )
      : ElevatedButton(
          onPressed: () {
            showReportsSummaryDialog(
                context,
                studentName: "Emma Jonson",
                courseName: "Algebra 1",
                grade: "A+",
                score: "85",
                progressValue: 0.85,
              );
            },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF444444),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        );
  }
}