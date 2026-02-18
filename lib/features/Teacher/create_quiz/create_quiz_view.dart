import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_provider.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/widget/custom_widget.dart';

class CreateQuizView extends ConsumerWidget{
  CreateQuizView({super.key});

 Widget build(BuildContext context, WidgetRef ref) {
   final quizState = ref.watch(quizProvider);
   final controller = ref.read(quizProvider.notifier);
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
                      onPressed: () => context.pop(), 
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 50.w),
                    Text(
                      'Create Quiz',
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
      padding:EdgeInsets.symmetric(horizontal: 10.w, vertical: 32.h),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quiz Details',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  buildFieldLabel('Quiz Name'),
                  buildInputField(hint: 'e.g., Linear Equations Quiz',controller:controller.nameController),
                  buildFieldLabel('Course'),
                  buildInputField(hint: 'Select course..', isDropdown: true),
                  buildFieldLabel('Class'),
                  buildInputField(hint: 'All classes..', isDropdown: true),
                  buildFieldLabel('Select date and time'),
                  buildInputField(
                    hint: 'Select your date and time',
                    suffixIcon: Icons.access_time,
                  ),
                  buildFieldLabel('Quiz time limit'),
                  buildInputField(
                    hint: 'Select your time',
                    suffixIcon: Icons.access_time,
                  ),
                  buildFieldLabel('Number of questions:'),
                  buildInputField(hint: 'Enter the number'),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Questions',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      buildGenerateButton(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  quizState.uploadedFiles.isEmpty
                  ? buildEmptyState(onTap: controller.pickFiles)
                  : buildFileListSection(
                    quizState.uploadedFiles,
                    controller,
                  ),
                  SizedBox(height: 20.h,),
                  GoldButton(
                    text: "Save Quiz",
                    onPressed: () {
                      final newQuiz = QuizModel(
                      quizName: controller.nameController.text,
                      totalPoints: "100", 
                      totalQuestions: controller.questionsController.text,
                      className: "Class 1", 
                      courseName: "Mathematics", 
                    );
                    ref.read(quizProvider.notifier).addQuiz(newQuiz);
                    context.pop();
                    },
                  )
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}


