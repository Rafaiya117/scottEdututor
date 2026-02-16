import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_gold_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/admin/student/student_controller.dart';
import 'package:scoctt_edututo/features/admin/student/student_model.dart';
import 'package:scoctt_edututo/features/admin/student/widget/popup.dart';
import 'package:scoctt_edututo/features/admin/student/widget/student_view_details_popup.dart';

class Student_View extends ConsumerWidget {
  Student_View({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentProvider);

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
                padding: EdgeInsets.only(top: 45.h, left: 7.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 100.w),
                    Text(
                      'Students',
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32.h),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GoldButton(
                width: 200.w,
                height: 37.h,
                text: 'Add Student',
                onPressed: () {
                  showAddStudentPopup(context, ref);
                },
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search by name and Id',
                                hintStyle: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.filter_alt_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                SizedBox(width: 4.w),
                                Flexible(
                                  child: Text(
                                    'All Classes',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildHeaderRow(),
                        ...students.map((student) =>
                            _buildDataRow(student, ref, context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4AF6A), width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: _headerText('Student Name')),
          Expanded(flex: 2, child: _headerText('Id')),
          Expanded(flex: 2, child: _headerText('Class')),
          Expanded(flex: 2, child: _headerText('Actions')),
        ],
      ),
    );
  }

  Widget _buildDataRow(Student student, WidgetRef ref, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4AF6A), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: _rowText(student.name)),
          Expanded(flex: 2, child: _rowText(student.id)),
          Expanded(flex: 2, child: _rowText(student.className)),
          // Actions column fixed
          IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  onPressed: () {
                    showViewStudentDetailsPopup(context);
                  },
                  icon: const Icon(
                    Icons.visibility_outlined,
                    size: 20,
                    color: Color(0xFF5A6B78),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 30,
                  ),
                  onPressed: () {
                    showEditStudentPopup(context, ref);
                  },
                  icon: const Icon(
                    Icons.edit_square,
                    size: 20,
                    color: Color(0xFF5A6B78),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.inter(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1A232E),
      ),
    );
  }

  Widget _rowText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.inter(
        fontSize: 13.sp,
        color: const Color(0xFF5A6B78),
      ),
    );
  }
}
