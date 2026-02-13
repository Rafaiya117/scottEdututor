import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_classcard.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/student/quizes/quiez_controller.dart';
import 'package:scoctt_edututo/features/student/quizes/quiz_provider.dart';
import 'package:scoctt_edututo/features/student/quizes/quizes_model.dart';

class StudentQuizView extends ConsumerWidget {
  StudentQuizView({super.key});
  
  final QuiezController controller = QuiezController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ClassCategory> categories = controller.getClassCategory();
    // Watch the state here in the parent
    final selectedCategory = ref.watch(selectedClassCategoryProvider);

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
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                    ),
                    SizedBox(width: 120.w,),
                    Text(
                      'Quiz',
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 110.w,),
                    GestureDetector(
                      onTap: () {
                        //context.push('/parents_profile');
                        // ref.read(bottomNavProvider.notifier).state = BottomNavItem.profile;
                        // context.go('/main');
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: Column(
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: categories.map((cat) {
              return ClassCategoryCard(
                height: 58.h, 
                width: double.infinity, 
                category: cat, 
                borderColor: Color(0xFFD4B579),
                cardColor: Colors.white, 
                isSelected: selectedCategory?.id == cat.id,
                onTap: () {
                  //ref.read(selectedClassCategoryProvider.notifier).state = cat;
                  context.push('/quiz_ques'); 
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}