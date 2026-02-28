import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scoctt_edututo/core/componets/custom_attendance.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attandance_model.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attendance_provider.dart';

class TeacherAttendanceView extends ConsumerStatefulWidget { 
  TeacherAttendanceView({super.key});

  @override
  ConsumerState<TeacherAttendanceView> createState() => _TeacherAttendanceViewState();
}

class _TeacherAttendanceViewState extends ConsumerState<TeacherAttendanceView> {
 DateTime _selectedDate = DateTime.now();
  String _selectedClass = "Select Class";

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    final attendanceList = ref.watch(attendanceListProvider);
    String formattedDate = DateFormat('E, MMM d').format(_selectedDate);

    // Dynamic Counts
    final total = attendanceList.length;
    final present = attendanceList.where((s) => s.status == 'Present').length;
    final absent = attendanceList.where((s) => s.status == 'Absent').length;
    final lateCount = attendanceList.where((s) => s.status == 'Late').length;

    // Theme wrapper to style the PopupMenu background and shape
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
        ),
      ),
      child: BackgroundTemplate(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Spacer(),
                Text('Attendance', style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _pickDate(context),
                    child: _buildSelector(formattedDate, Icons.chevron_left, Icons.chevron_right),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: PopupMenuButton<String>(
                    onSelected: (val) => setState(() => _selectedClass = val),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: "Class A", child: Text("Class A")),
                      const PopupMenuItem(value: "Class B", child: Text("Class B")),
                    ],
                    child: _buildSelector(_selectedClass, null, Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            const AttendanceRow(name: 'STUDENT NAME', phone: 'PHONE', status: 'STATUS', isHeader: true),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                ),
                child: ListView.builder(
                  itemCount: attendanceList.length,
                  itemBuilder: (context, index) {
                    final student = attendanceList[index];
                    return AttendanceRow(
                      name: student.name,
                      phone: student.phone,
                      status: student.status,
                      backgroundColor: index % 2 == 0 ? const Color(0xFFF2F2F2) : Colors.white,
                      onStatusChanged: (newStatus) {
                        final newList = [...attendanceList];
                        newList[index] = AttandanceModel(name: student.name, phone: student.phone, status: newStatus);
                        ref.read(attendanceListProvider.notifier).state = newList;
                      },
                    );
                  },
                ),
              ),
            ),
            // Dynamic Summary Bar
            Container(
              margin: EdgeInsets.only(top: 15.h),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(color: const Color(0xFFD3C8B4), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryText("Total Students", total.toString(), Colors.black),
                  _buildSummaryText("Present", present.toString().padLeft(2, '0'), const Color(0xFF27AE60)),
                  _buildSummaryText("Absent", absent.toString().padLeft(2, '0'), Colors.red),
                  _buildSummaryText("Late", lateCount.toString().padLeft(2, '0'), Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelector(String text, IconData? left, IconData? right) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (left != null) Icon(left, size: 20.sp),
          Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.sp)),
          if (right != null) Icon(right, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildSummaryText(String label, String value, Color color) {
    return Row(
      children: [
        Text("$label ", style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.bold)),
        Text(value, style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}