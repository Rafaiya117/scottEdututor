import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/componets/custom_categoryaction_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/student/student_home/student_home_controller.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';


class StudentHomeView extends ConsumerWidget{
  StudentHomeView({super.key});
    
 final StudentHomeController controller = StudentHomeController();
@override
  Widget build(BuildContext context, WidgetRef ref) {
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
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Explore with AI',
              style: GoogleFonts.poppins(
                color: Color(0xFFFFFFFF),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFE1EFFD),
              borderRadius: BorderRadius.circular(17.r),
              border: Border.all(
                color: Color(0xFFC7FF00)
              ),
            ),
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 24.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/magical_brush.svg',
                        width: 30.w,
                        height: 30.h,
                      ), // Ensure width is known
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Explore with AI',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              const Badge(
                                label: Text('24/7'),
                                backgroundColor: Color(0xFFB6DB34),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Get instant help. Personalized study plans',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF717171),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 39.w,), 
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/msg_icon.svg'),
                        SizedBox(width: 10.w),
                        Text(
                          'Start Conversation  →',
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: const Color(0xFF5B7400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    width: 256,
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(9)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/magical_brush_two.svg',
                          ),
                          SizedBox(width: 10.w,),
                          Flexible(
                            child: Text(
                              'Hi i noticed your learning react.want me to generate a practice quiz',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF000000),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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

