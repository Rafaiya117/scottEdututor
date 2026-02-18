import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/costom_course_row.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/widget/class_details_card.dart';

class ClassManagementDetails extends ConsumerWidget {
  ClassManagementDetails({super.key});

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
                    SizedBox(width: 40.w,),
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
            ClassCard(
              id: '101',
              title: 'Algebra II - Period 3',
              subject: 'Algebra II',
              description:'Master all Algebra II skills required for state standards',
              enrolledCount: '1',
              progress: '67%',
              createdDate: '01/09/2024',
              //onAddStudents: () => print('Adding students to 101'),
            ),
            SizedBox(height: 20.h),
            ClassCard(
              id: '102',
              title: 'Geometry - Period 1',
              subject: 'Geometry',
              description: 'Exploring shapes, sizes, and properties of space.',
              enrolledCount: '15',
              progress: '45%',
              createdDate: '05/09/2024',
              //onAddStudents: () => print('Adding students to 102'),
            ),
          ],
        ),
      ),
    );
  }
}