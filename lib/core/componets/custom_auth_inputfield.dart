import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/auth/login/login_provider.dart';

class CustomAuthInputfield extends ConsumerWidget {
  final String label;
  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final bool isPassword;
  final Color? fillColor; 
  final Color? textcolor;
  final Color?iconcolor;
  final Color? hintextclr;
  const CustomAuthInputfield({
    super.key,
    required this.label,
    required this.hintText,
    required this.height,
    required this.width,
    required this.controller,
    this.textcolor,
    this.iconcolor,
    this.hintextclr,
    this.isPassword = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(passwordVisibilityProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? !isVisible : false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: hintextclr,
            ),
            suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: iconcolor,
                  ),
                  onPressed: () {
                    ref.read(passwordVisibilityProvider.notifier).state = !isVisible;
                  },
                )
              : null,
            filled: fillColor != null, 
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Colors.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
