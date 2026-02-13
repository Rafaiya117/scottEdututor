import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryActionCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CategoryActionCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0.r),
        color: backgroundColor,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(height: 5.h),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF211C1C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}