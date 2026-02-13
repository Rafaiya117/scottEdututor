
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/componets/custom_categoryaction_card.dart';
import 'package:scoctt_edututo/core/componets/custom_classcard.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_controller.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_provider.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class TeacherHomeView extends ConsumerWidget{
  TeacherHomeView({super.key});

  final ClassManagementController controller = ClassManagementController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ClassCategory2> categories = controller.getClassCategory();
    final selectedCategory2 = ref.watch(selectedClassCategory2Provider);
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
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome David',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Monitor your child\'s Prograss',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80.w,),
                    GestureDetector(
                      onTap: () {
                        //context.push('/parents_profile');
                        ref.read(bottomNavProvider.notifier).state = BottomNavItem.profile;
                        context.go('/main');
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
            spacing: 20.w,
            runSpacing: 20.h,
            children: [
              CategoryActionCard(
                title: 'My Courses',
                iconPath: 'assets/icons/courses.svg',
                backgroundColor: const Color(0xFFFFF7ED),
                onTap: () => context.push('/my_courses'),
              ),
              CategoryActionCard(
                title: 'Quiz',
                iconPath: 'assets/icons/quiz.svg',
                backgroundColor: const Color(0xFFCACACA),
                onTap: () => context.push('/quizes'),
              ),
              CategoryActionCard(
                title: 'AI Tutor',
                iconPath: 'assets/icons/ai_tutor.svg',
                backgroundColor: const Color(0xFFE5CCFF),
                onTap: () => context.push('/assignments'),
              ),
              CategoryActionCard(
                title: 'My Prograss',
                iconPath: 'assets/icons/prograss.svg',
                backgroundColor: const Color(0xFFE7FFEC),
                onTap: () => context.push('/my_prograss'),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Flexible(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: categories.map((cat) {
                return ClassCategoryCard(
                  height: 58.h, 
                  width: double.infinity, 
                  category: cat, 
                  borderColor: Color(0xFFD4B579),
                  cardColor: Colors.white, 
                  isSelected: selectedCategory2?.id == cat.id,
                  onTap: () {
                    //ref.read(selectedClassCategoryProvider.notifier).state = cat;
                    context.push('/class_management_details'); 
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}



