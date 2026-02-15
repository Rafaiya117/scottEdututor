import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/admin/classes/class_model.dart';
import 'package:scoctt_edututo/features/admin/classes/class_provider.dart';

class ClassView extends ConsumerWidget {
  ClassView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the list of classes from the provider
    final classList = ref.watch(classListProvider);

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
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                    ),
                    SizedBox(width: 90.w),
                    Text(
                      'Attendance',
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
          children: [
            _buildCreateButton(context, ref), // Correctly passing context and ref
            SizedBox(height: 20.h),
            ...classList
                .map((item) => Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: _buildClassCard(context, ref, item), // Passing context/ref for edit
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          _showClassPopup(context, ref); // Calling without data for "Create"
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD4AF6A),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create Class",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 12),
            Icon(Icons.add, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildClassCard(BuildContext context, WidgetRef ref, ClassModel data) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F2E9),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A232E)),
              ),
              IconButton(
                onPressed: () => _showClassPopup(context, ref, classData: data), // Opens for edit
                icon: const Icon(Icons.edit_outlined,
                    color: Color(0xFFC5A059), size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            data.description,
            style: const TextStyle(
                fontSize: 12, color: Color(0xFF5A6B78), height: 1.4),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat(Icons.menu_book_outlined, '${data.students} Students'),
              _buildStat(
                  Icons.track_changes_outlined, '${data.teachers} Teachers'),
              _buildStat(Icons.school_outlined, '${data.courses} Course'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFC5A059)),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(color: Color(0xFF5A6B78), fontSize: 12)),
      ],
    );
  }

  void _showClassPopup(BuildContext context, WidgetRef ref, {ClassModel? classData}) {
    final bool isEditing = classData != null;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.black),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                _buildLabel("Class Name"),
                _buildTextField(isEditing ? classData.title : "Enter class name"),
                const SizedBox(height: 16),
                _buildLabel(isEditing ? "Class Details" : "Learning Object"),
                _buildTextField(isEditing ? classData.description : "Enter details"),
                const SizedBox(height: 16),
                _buildLabel("Assign Teacher"),
                _buildDropdownField("Select teacher"),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton(
                      label: "Cancel",
                      onPressed: () => Navigator.pop(context),
                      isPrimary: false,
                    ),
                    const SizedBox(width: 12),
                    _buildButton(
                      label: isEditing ? "Save Changes" : "Create Class",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isPrimary: true,
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          items: const [],
          onChanged: (value) {},
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String label,
      required VoidCallback onPressed,
      required bool isPrimary}) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isPrimary ? const Color(0xFF424242) : Colors.white,
          foregroundColor: isPrimary ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: isPrimary
                ? BorderSide.none
                : const BorderSide(color: Color(0xFFD1D1D1)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}