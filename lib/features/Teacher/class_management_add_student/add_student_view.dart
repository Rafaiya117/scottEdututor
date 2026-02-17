import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/costom_course_row.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class AddStudentView extends ConsumerWidget{
  AddStudentView({super.key});

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
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 50.w,),
                    Text(
                      'Class Management',
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 380.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoTile('Student Name', 'Emma Rodriguez'),
                  buildInfoTile('Email', 'emmajohnson@email.com'),
                  buildInfoTile('Class', 'emmajohnson@email.com'),
                  buildInfoTile('Class', 'Class 1'),
                  buildInfoTile('Course Name', 'Course Name'),               
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              width: 380.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoTile('Student Name', 'Emma Rodriguez'),
                  buildInfoTile('Email', 'emmajohnson@email.com'),
                  buildInfoTile('Class', 'emmajohnson@email.com'),
                  buildInfoTile('Class', 'Class 1'),
                  buildInfoTile('Course Name', 'Course Name'),               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}