import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showAddUserPopup(BuildContext context) {
  String? selectedRole;
  String? selectedClass;
  const rolesWithClasses = ['Student', 'Teacher', 'Parent'];

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            // Use insetPadding to allow the dialog to expand to the edges
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            child: Container(
              // Set width to infinity as requested
              width: double.infinity, 
              padding: EdgeInsets.all(20.w),
              child: SingleChildScrollView( // Added to prevent overflow on smaller screens
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_add_alt_1_outlined, size: 28.sp),
                        SizedBox(width: 10.w),
                        Text(
                          'Add New User',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Create a new student account and assign them to classes.',
                      style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 20.h),

                    _buildLabel('Full Name'),
                    _buildTextField('Enter full name'),

                    _buildLabel('Email Address'),
                    _buildTextField('Enter email address'),

                    _buildLabel('Select Role'),
                    _buildDropdown(
                      hint: 'Select user role',
                      value: selectedRole,
                      items: ['Admin', 'Teacher', 'Student', 'Parent'],
                      onChanged: (val) {
                        setState(() {
                          selectedRole = val;
                          if (!rolesWithClasses.contains(val)) selectedClass = null;
                        });
                      },
                    ),

                    // Conditional Class Dropdown
                    if (rolesWithClasses.contains(selectedRole)) ...[
                      SizedBox(height: 16.h),
                      _buildLabel('Select Class'),
                      _buildDropdown(
                        hint: 'Select your class',
                        value: selectedClass,
                        items: ['Class 1', 'Class 2', 'Class 3'],
                        onChanged: (val) => setState(() => selectedClass = val),
                      ),
                    ],

                    SizedBox(height: 32.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildButton(
                          text: 'Cancel',
                          isOutlined: true,
                          onPressed: () => Navigator.pop(context),
                        ),
                        SizedBox(width: 12.w),
                        _buildButton(
                          text: 'Add User',
                          isOutlined: false,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildLabel(String label) {
  return Padding(
    padding: EdgeInsets.only(bottom: 6.h),
    child: Text(
      label,
      style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
    ),
  );
}

Widget _buildTextField(String hint) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.h),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.grey),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      ),
    ),
  );
}

Widget _buildDropdown({
  required String hint,
  required String? value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint, style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.grey)),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

Widget _buildButton({required String text, required bool isOutlined, required VoidCallback onPressed}) {
  return SizedBox(
    height: 40.h,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isOutlined ? Colors.white : const Color(0xFF333333),
        foregroundColor: isOutlined ? Colors.grey : Colors.white,
        side: isOutlined ? const BorderSide(color: Color(0xFF333333)) : BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
      ),
      child: Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
    ),
  );
}