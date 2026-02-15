import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GoldButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;

  const GoldButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity, 
    this.height = 56.0,          
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD4B483), 
          foregroundColor: Colors.white,            
          elevation: 0,                             
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), 
          ),
          textStyle:GoogleFonts.poppins(
            fontSize: 15.98.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}