import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends ConsumerWidget{
  final String buttontext;
  final Color buttonColor;
  final Color buttonTextColor;
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback ontap;
  const CustomButton({
    super.key,
    required this.buttontext,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return GestureDetector(
      onTap: ontap,
        child: Container(
        width: buttonWidth,
        height:buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:buttonColor,
        ),
        child: Center(
          child: Text(
            buttontext,
            style:GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}