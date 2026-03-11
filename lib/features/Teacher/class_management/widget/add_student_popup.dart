import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_provider.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/widget/searchable_drop_down.dart';

void showAddStudentPopup(BuildContext context, WidgetRef ref) async {
  final controller = ref.read(classManagementProvider);
  await controller.fetchStudentEmails(ref); 

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setDialogState) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_add_alt_1_outlined, size: 28.sp),
                      SizedBox(width: 12.w),
                      Text(
                        'Add New Student',
                        style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Create a new student account and assign them to classes.',
                    style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black54),
                  ),
                  SizedBox(height: 24.h),
                  // Student email dropdown
                  SearchableDropdownField(
                    label: 'Email Address',
                    items: controller.studentEmailList, 
                    onSelected: (val) {
                      setDialogState(() => controller.setStudentEmail(val));
                    },
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          controller.disposeAddStudent();
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.grey[700])),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        onPressed: () async {
                          final selectedClass = ref.read(selectedClassCategory2Provider);

                          debugPrint("Selected Email: ${controller.selectedStudentEmail}");
                          debugPrint("Class Text: ${controller.addStudentClassController.text}");
                          debugPrint("Course Text: ${controller.addStudentCourseController.text}");
                          debugPrint("Selected Class ID: ${selectedClass?.id}");

                          if (selectedClass != null) {
                            await controller.enrollStudent(
                              context: context,
                              ref: ref,
                              classId: selectedClass.id,
                            );
                          } else {
                            debugPrint("No class selected!");
                          }

                          controller.disposeAddStudent();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D2D2D),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: Text('Add Student', style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildPopupField(String label, String hint, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 8.h),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFFF0F0F0), // Light grey fill
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    ],
  );
}