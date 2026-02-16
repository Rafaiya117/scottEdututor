import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class UserReport extends ConsumerWidget {
  const UserReport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
                SizedBox(width: 120.w),
                Text(
                  'Reports',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildReportTableContainer(),
          ],
        ),
      ),
    );
  }


  Widget _buildReportTableContainer() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _reportLabel('Course Name')),
              Expanded(flex: 3, child: _reportLabel('Progress Score')),
            ],
          ),
          SizedBox(height: 8.h),
          _buildProgressRow('Algebra 1', '85%', 0.85),
          _reportDivider(),
          _buildProgressRow('Algebra 2', '85%', 0.85),
          _reportDivider(),
          _reportLabel('Grade'),
          SizedBox(height: 6.h),
          Text(
            'Algebra I - Period 1',
            style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          _reportDivider(),
          _reportLabel('Score'),
          SizedBox(height: 6.h),
          Text(
            '85',
            style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          _reportDivider(),
        ],
      ),
    );
  }

  Widget _reportLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 13.sp,
        color: const Color(0xFF9098A1),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _reportDivider() {
    return Column(
      children: [
        SizedBox(height: 12.h),
        const Divider(color: Color(0xFFDDEBFF), thickness: 1),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildProgressRow(String title, String percentage, double progress) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  percentage,
                  style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8.h,
                      backgroundColor: const Color(0xFFE0E0E0),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB8D935)),
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