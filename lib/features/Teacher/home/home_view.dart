
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
import 'package:scoctt_edututo/core/utils/side_bar/model.dart';
import 'package:scoctt_edututo/core/utils/side_bar/widget/custom_side_bar.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_controller.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_provider.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class TeacherHomeView extends ConsumerWidget{
  TeacherHomeView({super.key});

  final ClassManagementController controller = ClassManagementController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final List<SidebarItem> menuList = [
      SidebarItem(title: 'Dashboard', svgPath: 'assets/icons/dash_board.svg', route: '/student_home_view'),
      SidebarItem(title: 'My Classes', svgPath: 'assets/icons/courses_icon.svg', route: '/my_courses'),
      SidebarItem(title: 'Courses', svgPath: 'assets/icons/courses_icon.svg', route: '/quizes'),
      SidebarItem(title: 'Quizzes', svgPath: 'assets/icons/quiz_icon.svg', route: '/ai_tutor'),
      SidebarItem(title: 'Reports', svgPath: 'assets/icons/report_icon.svg', route: '/report_summery'),
      SidebarItem(title: 'Attendance', svgPath: 'assets/icons/attendance.svg', route: '/attendance'),
    ];
    final List<ClassCategory2> categories = controller.getClassCategory();
    final selectedCategory2 = ref.watch(selectedClassCategory2Provider);
    return BackgroundTemplate(
      drawer: CustomSidebar(items: menuList),
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
                    Builder(
                      builder: (innerContext) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(innerContext).openDrawer();
                          },
                          icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                        );
                      },
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome David',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Monitor your child\'s Prograss',
                          style: GoogleFonts.poppins(
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 20.w,
              runSpacing: 20.h,
              children: [
                CategoryActionCard(
                  title: 'Create Quiz',
                  iconPath: 'assets/icons/teacher_create_quiz.svg',
                  backgroundColor: const Color(0xFFCACACA),
                  onTap: () => context.push('/teacher/quiz_view'),
                ),
                CategoryActionCard(
                  title: 'View Reports',
                  iconPath: 'assets/icons/prograss.svg',
                  backgroundColor: const Color(0xFFE7FFEC),
                  onTap: () => context.push('/report'),
                ),
                CategoryActionCard(
                  title: 'Courses',
                  iconPath: 'assets/icons/courses.svg',
                  backgroundColor: const Color(0xFFFFF7ED),
                  onTap: () => context.push('/courses'),
                ),
                CategoryActionCard(
                  title: 'Attendance',
                  iconPath: 'assets/icons/courses.svg',
                  backgroundColor: const Color(0xFFE5CCFF),
                  onTap: () => context.push('/teacher/attendance'),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
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
                  isSelected: selectedCategory2?.id == cat.id,
                  onTap: () {
                    //ref.read(selectedClassCategoryProvider.notifier).state = cat;
                    context.push('/class_management_details'); 
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}



