import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_radio_option.dart';
import 'package:scoctt_edututo/features/student/quizes/quiz_provider.dart';
import 'package:scoctt_edututo/features/student/quizes/quizes_model.dart';

class QuestionBlock extends StatelessWidget {
  final int questionId; // Added this
  final String questionLabel;
  final String points;
  final List<RadioOption<int>> options;
  final int? selected;
  final WidgetRef ref;

  const QuestionBlock({
    required this.questionId, // Added this
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
        
        ...options.map((option) => Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: CustomRadioTile<int>(
            value: option.value,
            groupValue: selected,
            label: option.label,
            onChanged: (val) {
              // Fix: Update the Map state for this specific ID
              final currentMap = ref.read(selectedRadioProvider);
              ref.read(selectedRadioProvider.notifier).state = {
                ...currentMap,
                questionId: val,
              };
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFFD4B579)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFFD4B579), width: 2),
            ),
          ),
        ),
        SizedBox(height: 30.h), 
      ],
    );
  }
}