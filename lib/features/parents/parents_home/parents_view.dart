import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class ParentsView extends ConsumerWidget{
  ParentsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
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
                padding:EdgeInsets.only(top: 45.h,left: 8.0.w),
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
                    SizedBox(width: 90.w,),
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
          Container(
            width: double.infinity,
            //height: 217.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
            ),
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 12.w,vertical:24.h),
              child: Column(
                children: [
                  Text(
                    'View Your Child Prograss',
                    style:GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF000000),
                      //letterSpacing: 1
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    width:190.w,
                    //height: 63.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE7BE),
                      border: Border.all(
                        color: Color(0xFFD0AD6B),
                        width: 3.w,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: TextButton(
                      onPressed: (){
                        context.push('/child_prograss');
                      }, 
                      child:Column(
                        children: [
                          Text(
                            'Maria',
                            style: GoogleFonts.poppins(
                              fontSize:20.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF000000),
                            ),
                          ),
                          //SizedBox(height: 5.h,),
                          Text(
                            'satyyy@gmail.com',
                            style: GoogleFonts.poppins(
                              fontSize:12.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                   Container(
                    width:190.w,
                    //height: 63.h,
                    decoration: BoxDecoration(
                      //color: Color(0xFFFFE7BE),
                      border: Border.all(
                        color: Color(0xFFD0AD6B),
                        width: 3.w,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: TextButton(
                      onPressed: (){
                        context.push('/child_prograss');
                      }, 
                      child:Text(
                        'Add Child',
                        style: GoogleFonts.poppins(
                          fontSize:20.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF000000),
                        ),
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