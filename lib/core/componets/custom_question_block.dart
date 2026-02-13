import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_radio_option.dart';
import 'package:scoctt_edututo/features/student/quizes/quiz_provider.dart';
import 'package:scoctt_edututo/features/student/quizes/quizes_model.dart';

class QuestionBlock extends StatelessWidget {
  final String questionLabel;
  final String points;
  final List<RadioOption<int>> options;
  final int? selected;
  final WidgetRef ref;

  const QuestionBlock({
    required this.questionLabel,
    required this.points,
    required this.options,
    required this.selected,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(questionLabel, style: GoogleFonts.figtree(fontWeight: FontWeight.w500)),
        SizedBox(height: 10.h),
        Text('Answer Options', style: GoogleFonts.figtree(fontWeight: FontWeight.w500)),
        SizedBox(height: 10.h),
        
        // Options List
        ...options.map((option) => Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: CustomRadioTile<int>(
            value: option.value,
            groupValue: selected,
            label: option.label,
            onChanged: (val) {
              ref.read(selectedRadioProvider.notifier).state = val;
            },
          ),
        )),

        SizedBox(height: 10.h),
        Text('Points', style: GoogleFonts.figtree(fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        TextFormField(
          initialValue: points,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              // ignore: deprecated_member_use
              borderSide: BorderSide(color: Color(0xFFD4B579)),
            ),
          ),
        ),
        SizedBox(height: 30.h), 
      ],
    );
  }
}

Widget buildActionButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      OutlinedButton(
        onPressed: () {},
        child: const Text('Cancel', style: TextStyle(color: Colors.black)),
      ),
      SizedBox(width: 12.w),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A4441)),
        child: const Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}