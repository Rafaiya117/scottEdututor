import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showEditUserPopup(BuildContext context, {Map<String, String>? initialData}) {
  // Initialize with existing user data
  String name = initialData?['name'] ?? '';
  String email = initialData?['email'] ?? '';
  String? selectedRole = initialData?['role'];
  String? selectedClass = initialData?['class'];

  // Roles that require a class assignment based on your images
  const rolesWithClasses = ['Student', 'Teacher', 'Parent'];

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit User',
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Name Field
                    _buildLabel('Name'),
                    _buildTextField(
                      hint: 'Enter name',
                      initialValue: name,
                      onChanged: (val) => name = val,
                    ),

                    // Email Field
                    _buildLabel('Email Address'),
                    _buildTextField(
                      hint: 'Enter email address',
                      initialValue: email,
                      onChanged: (val) => email = val,
                    ),

                    // Role Dropdown
                    _buildLabel('Roles'),
                    _buildDropdown(
                      hint: 'Select role',
                      value: selectedRole,
                      items: ['Admin', 'Teacher', 'Student', 'Parent'],
                      onChanged: (val) {
                        setState(() {
                          selectedRole = val;
                          if (!rolesWithClasses.contains(val)) selectedClass = null;
                        });
                      },
                    ),
                    if (rolesWithClasses.contains(selectedRole)) ...[
                      SizedBox(height: 16.h),
                      _buildLabel('Select Class'),
                      _buildDropdown(
                        hint: 'Select your class',
                        value: selectedClass,
                        items: ['Class A', 'Class B', 'Class C'],
                        onChanged: (val) => setState(() => selectedClass = val),
                      ),
                    ],
                    SizedBox(height: 32.h),
                    // Action Buttons
                    Row(
                      children: [
                        // Delete Account Button
                        _buildActionButton(
                          text: 'Delete Account',
                          color: const Color(0xFFD91E41), // Matching image red
                          textColor: Colors.white,
                          onPressed: () {
                            // Handle Delete
                            Navigator.pop(context);
                          },
                        ),
                        const Spacer(),
                        // Cancel Button
                        _buildActionButton(
                          text: 'Cancel',
                          color: Colors.white,
                          textColor: Colors.grey[700]!,
                          isOutlined: true,
                          onPressed: () => Navigator.pop(context),
                        ),
                        SizedBox(width: 8.w),
                        // Save Button
                        _buildActionButton(
                          text: 'Save',
                          color: const Color(0xFF333333), // Dark grey from image
                          textColor: Colors.white,
                          onPressed: () {
                            // Handle Save Logic
                            Navigator.pop(context);
                          },
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

// --- Internal Helper Widgets for Styling ---

Widget _buildLabel(String label) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}

Widget _buildTextField({required String hint, String? initialValue, required Function(String) onChanged}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.h),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: GoogleFonts.inter(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 13.sp),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint, style: GoogleFonts.inter(color: Colors.grey, fontSize: 13.sp)),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

Widget _buildActionButton({
  required String text,
  required Color color,
  required Color textColor,
  bool isOutlined = false,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    height: 40.h,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: isOutlined ? BorderSide(color: Colors.grey[300]!) : BorderSide.none,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 13.sp, fontWeight: FontWeight.bold),
      ),
    ),
  );
}