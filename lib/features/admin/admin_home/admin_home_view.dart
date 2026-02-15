import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/componets/custom_categoryaction_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class AdminHomeView extends ConsumerWidget{
  AdminHomeView({super.key});
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
                title: 'Classes     ',
                iconPath: 'assets/icons/quiz.svg',
                backgroundColor: const Color(0xFFCACACA),
                onTap: () => context.push('/'),
              ),
              CategoryActionCard(
                title: 'View Reports',
                iconPath: 'assets/icons/prograss.svg',
                backgroundColor: const Color(0xFFE7FFEC),
                onTap: () => context.push('/'),
              ),
              CategoryActionCard(
                title: 'Quiz',
                iconPath: 'assets/icons/courses.svg',
                backgroundColor: const Color(0xFFFFF7ED),
                onTap: () => context.push('/'),
              ),
              CategoryActionCard(
                title: 'Student',
                iconPath: 'assets/icons/courses.svg',
                backgroundColor: const Color(0xFFE5CCFF),
                onTap: () => context.push('/'),
              ),
              CategoryActionCard(
                title: 'Users',
                iconPath: 'assets/icons/courses.svg',
                backgroundColor: const Color(0xFFFFF7ED),
                onTap: () => context.push('/'),
              ),
              CategoryActionCard(
                title: 'Courses',
                iconPath: 'assets/icons/courses.svg',
                backgroundColor: const Color(0xFFE5CCFF),
                onTap: () => context.push('/'),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Platform Statistics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                _buildStatRow('Avg. Student Progress'),
                const SizedBox(height: 12),
                _buildStatRow('Skills Mastered (Total)'),
                const SizedBox(height: 12),
                _buildStatRow('Active This Week'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}


