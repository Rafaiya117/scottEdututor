import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_attendance.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attendance_provider.dart';

class AttendanceView extends ConsumerWidget{
  AttendanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceList = ref.watch(attendanceListProvider);
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
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
                        context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 90.w,),
                    Text(
                      'Attendance',
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
      padding:EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
      body: Column(
        children: [
          const AttendanceRow(
            name: 'STUDENT NAME',
            phone: 'PHONE',
            status: 'STATUS',
            isHeader: true,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: attendanceList.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: Colors.black12),
              itemBuilder: (context, index) {
                final student = attendanceList[index];
                return AttendanceRow(
                  name: student.name,
                  phone: student.phone,
                  status: student.status,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}