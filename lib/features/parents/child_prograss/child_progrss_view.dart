import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class ChildProgrssView extends ConsumerWidget{
  ChildProgrssView({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:EdgeInsets.only(top: 45.h,left: 8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        //context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/menu_icon.svg'),
                    ),
                    SizedBox(width: 280.w,),
                    GestureDetector(
                      onTap: () {
                        //context.push('/profile');
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
            height: 217,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: (){
                    context.push('/lesson_view');
                  }, 
                  child:Text(
                    'Maria',
                    style: GoogleFonts.inter(
                      fontSize:12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),   
              ],
            ),
          ),
        ],
      ),
    );
  }
}