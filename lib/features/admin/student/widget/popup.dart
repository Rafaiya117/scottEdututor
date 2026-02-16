import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/admin/student/student_provider.dart';

void showAddStudentPopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Use Consumer here so only the dialog rebuilds when an item is selected
      return Consumer(
        builder: (context, ref, child) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Padding(
              padding: EdgeInsets.all(24.w),
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
                        style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Create a new student account and assign them to classes.',
                    style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.black54),
                  ),
                  SizedBox(height: 24.h),
                  _buildLabel('Full Name'),
                  _buildTextField('Enter full name'),
                  SizedBox(height: 16.h),
                  _buildLabel('Email Address'),
                  _buildTextField('Enter email address'),
                  SizedBox(height: 16.h),
                  _buildLabel('Select Class'),
                  // Passing ref so it can watch the selectedClassProvider
                  _buildDropdownField(ref, 'Select your class'),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: const Text('Cancel'),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E2E2E),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: const Text('Add Student', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

//!--------- Edit Student Popup ----------!

void showEditStudentPopup(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, child) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Header with Edit Icon
                  Row(
                    children: [
                      Icon(Icons.edit_note_outlined, size: 30.sp),
                      SizedBox(width: 12.w),
                      Text(
                        'Edit Student',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  
                  // 2. Subtitle
                  Text(
                    'Update student information and class assignments.',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // 3. Form Fields
                  _buildLabel('Student ID'),
                  _buildTextField('Enter student ID'),
                  
                  SizedBox(height: 16.h),
                  
                  _buildLabel('Student Name'),
                  _buildTextField('Enter student name'),
                  
                  SizedBox(height: 16.h),
                  
                  _buildLabel('Email Address'),
                  _buildTextField('Enter email address'),
                  
                  SizedBox(height: 16.h),
                  
                  _buildLabel('Select Class'),
                  _buildDropdownField(ref, 'Select your class'),

                  SizedBox(height: 32.h),

                  // 4. Action Buttons Row (Matches Frame 2147228360.png)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD91B41),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Delete Account',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w),

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E2E2E),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Save',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

//!----------------------------!

// Updated Dropdown with the "Checked" logic
Widget _buildDropdownField(WidgetRef ref, String hint) {
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4'];
  final selectedClass = ref.watch(selectedClassProvider);

  return Container(
    height: 50.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F0F0),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedClass,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(hint, style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.grey)),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        dropdownColor: const Color(0xFFF0F0F0),
        items: classes.map((String value) {
          bool isSelected = selectedClass == value;
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFD4AF6A) : const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: isSelected 
                      ? Icon(Icons.check, size: 12.sp, color: Colors.white) 
                      : null,
                ),
                SizedBox(width: 12.w),
                Text(value, style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.black)),
              ],
            ),
          );
        }).toList(),
        onChanged: (val) => ref.read(selectedClassProvider.notifier).state = val,
      ),
    ),
  );
}

// Re-using existing label and textfield helpers...
Widget _buildLabel(String label) => Padding(
  padding: EdgeInsets.only(bottom: 8.h),
  child: Text(label, style: GoogleFonts.inter(fontSize: 15.sp, fontWeight: FontWeight.w600)),
);

Widget _buildTextField(String hint) => Container(
  height: 50.h,
  decoration: BoxDecoration(color: const Color(0xFFF0F0F0), borderRadius: BorderRadius.circular(8.r)),
  child: TextField(
    decoration: InputDecoration(
      hintText: hint,
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
  ),
);