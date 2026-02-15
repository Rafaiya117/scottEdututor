import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';

class AllCourses extends ConsumerWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'All Courses',
                      style: GoogleFonts.inter(
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Passed context here to resolve the positional argument error
            _buildDataTableContainer(context), 
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableContainer(BuildContext context) {
    final List<Map<String, String>> tableData = List.generate(
      15,
      (index) => {
        'course': index % 2 == 0 ? 'Algebra II' : 'English Literature 9',
        'lesson': '4 lessons',
      },
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9), // Grey header background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Course Name',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Lesson',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const Spacer(), 
              ],
            ),
          ),
          // Table Rows - Passing context to the row builder
          ...tableData.map((data) => _buildDataRow(data['course']!, data['lesson']!, context)),
        ],
      ),
    );
  }

  Widget _buildDataRow(String course, String lesson, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4AF6A), width: 0.5), // Tan divider
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              course,
              style: GoogleFonts.inter(color: const Color(0xFF5A6B78), fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              lesson,
              style: GoogleFonts.inter(color: const Color(0xFF5A6B78), fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () {
              context.push('/admin/lesson_view');
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero, 
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'View More',
              style: GoogleFonts.inter(
                color: const Color(0xFF5E5CE6), // Blue link color
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}