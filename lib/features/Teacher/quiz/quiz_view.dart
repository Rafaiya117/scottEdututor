import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_provider.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/widget/quiz_card.dart';

// class QuizViews extends ConsumerWidget{
//   QuizViews({super.key});

//   Widget build(BuildContext context, WidgetRef ref) {
//     final quizState = ref.watch(quizProvider);
//     return BackgroundTemplate(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.h),
//         child: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       onPressed: () => context.pop(), 
//                       icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
//                     ),
//                     SizedBox(width: 90.w),
//                     Text(
//                       'Quizzes',
//                       style: GoogleFonts.poppins(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       padding:EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
//       body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//               child: GoldButton(
//                 width: 200.w,
//                 height: 37.h,
//                 text: 'Create Quiz',
//                 onPressed: () => context.push('/teacher/create_quiz'),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             quizState.quizzes.isEmpty 
//               ? Center(child: Text("No Quiz now.", style: TextStyle(color: Colors.white70, fontSize: 16.sp)))
//               : ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: quizState.quizzes.length,
//               separatorBuilder: (_, __) => SizedBox(height: 12.h),
//               itemBuilder: (context, index) => QuizCard(
//                 quiz: quizState.quizzes[index],
//                 onDelete: () => ref.read(quizProvider.notifier).deleteQuiz(index),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class QuizViews extends ConsumerWidget {
  QuizViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);

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
                    SizedBox(width: 90.w),
                    Text(
                      'Quizzes',
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GoldButton(
                width: 200.w,
                height: 37.h,
                text: 'Create Quiz',
                onPressed: () => context.push('/teacher/create_quiz'),
              ),
            ),
            SizedBox(height: 20.h),
            
            // Dynamic Quiz List Logic
            quizState.quizzes.isEmpty
              ? Padding(
              padding: EdgeInsets.only(top: 50.h),
                child: Center(
                  child: Text(
                    "No Quiz available now.",
                    style: GoogleFonts.poppins(
                      color: Colors.white70, 
                      fontSize: 16.sp
                      ),
                    ),
                  ),
                )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizState.quizzes.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) => QuizCard(
                      quiz: quizState.quizzes[index],
                      onDelete: () => ref.read(quizProvider.notifier).deleteQuiz(index),
                      onTap: () => context.push('/teacher/quiz_details',
                        extra: index,
                      ), // Pass the index here
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }