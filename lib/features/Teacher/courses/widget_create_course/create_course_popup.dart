import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_provider.dart';

void showCreateCoursePopup(BuildContext context, WidgetRef ref) {
  final classController = TextEditingController();
  final courseController = TextEditingController();

  List<PlatformFile> uploadedFiles = [];
  int? selectedClassId;

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// ⭐ Class dropdown (from API)
              _buildPopupField(
                'Class Name',
                'Select Class',
                classController,
                isDropdown: true,
                onTap: () => _showClassPicker(
                  context,
                  ref,
                  classController,
                  setState,
                  (id) => selectedClassId = id,
                ),
              ),

              SizedBox(height: 16.h),

              /// ⭐ Course name
              _buildPopupField(
                'Course Name',
                'Type course name',
                courseController,
                onTap: () {},
              ),

              SizedBox(height: 20.h),

              /// ⭐ File Upload Section
              if (uploadedFiles.isEmpty)
                _buildEmptyState(
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'doc'],
                    );
                    if (result != null) {
                      setState(() => uploadedFiles.addAll(result.files));
                    }
                  },
                )
              else
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...uploadedFiles
                          .map((file) => _buildFilePreview(file.name)),
                      SizedBox(width: 12.w),
                      _buildAddFileButton(
                        onTap: () async {
                          final result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc'],
                          );
                          if (result != null) {
                            setState(
                                () => uploadedFiles.addAll(result.files));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 32.h),
              /// ⭐ Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  SizedBox(width: 12.w),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedClassId == null) {
                        debugPrint("No class selected!");
                        return;
                      }
                      final classIds = [selectedClassId!];
                      await ref.read(courseProvider).createCourseAndRefresh(
                        ref: ref,
                        name: courseController.text,
                        classIds: classIds,
                        files: uploadedFiles,
                      );
                      // ✅ Show success snackbar after creation
                      showCustomSnackBar(
                        context,
                        "Course created successfully",
                        CustomSnackType.success,
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Create Course'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// The box shown after a file is uploaded
Widget _buildFilePreview(String fileName) {
  return Container(
    width: 100.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: Colors.grey.shade300, width: 1), // Using solid as standard, DottedBorder package recommended
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 24.sp),
        SizedBox(height: 4.h),
        Text(fileName, style: GoogleFonts.poppins(fontSize: 10.sp)),
      ],
    ),
  );
}

// The "Add File" dashed button
Widget _buildAddFileButton({required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: CustomPaint(
      painter: DashedBorderPainter(), // Apply dashed effect
      child: SizedBox(
        width: 100.w,
        height: 80.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_add_outlined, size: 24.sp),
            Text('Add file', style: GoogleFonts.poppins(fontSize: 10.sp)),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPopupField(String label, String hint, TextEditingController controller, {bool isDropdown = false, required VoidCallback onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600)),
      SizedBox(height: 8.h),
      TextField(
        controller: controller,
        readOnly: isDropdown, 
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: isDropdown ? Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 20.sp) : null,
          filled: true,
          fillColor: const Color(0xFFE0E0E0).withOpacity(0.5), 
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
    ],
  );
}


Widget _buildEmptyState({required VoidCallback onTap}) {
  return GestureDetector( 
    onTap: onTap,
    child: CustomPaint(
      painter: DashedBorderPainter(), 
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_add_outlined, size: 48.sp, color: const Color(0xFF1A1A1A)),
            SizedBox(height: 12.h),
            Text(
              'No questions yet. Click "Add\nQuestion" to start.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black54, height: 1.5),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showClassPicker(
  BuildContext context,
  WidgetRef ref,
  TextEditingController controller,
  StateSetter setState,
  Function(int id) onClassSelected,
) {
  showDialog(
    context: context,
    builder: (context) => FutureBuilder<List<Map<String, dynamic>>>(
      future: ref.read(courseProvider).fetchMyClasses(ref),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final classes = snapshot.data!;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            width: 250.w,
            constraints: BoxConstraints(maxHeight: 300.h),
            child: classes.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Text(
                        'No classes assigned',
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: classes.map((c) {
                        final classId = c['id'] as int;
                        final className = c['class_name'] as String;

                        return ListTile(
                          dense: true,
                          title: Text(
                            className,
                            style: GoogleFonts.poppins(fontSize: 14.sp),
                          ),
                          onTap: () {
                            controller.text = className;
                            onClassSelected(classId);
                            Navigator.pop(context);
                            setState(() {});
                          },
                        );
                      }).toList(),
                    ),
                  ),
          ),
        );
      },
    ),
  );
}


class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(12.r)));
    
    // Draw dashed effect
    double dashWidth = 5.0;
    double dashSpace = 3.0;
    double distance = 0.0;
    
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}