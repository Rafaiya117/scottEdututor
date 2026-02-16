import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String svgPath;
  final String route;
  final bool isDrawerMode;

  const StatCard({
    super.key,
    required this.title,
    required this.svgPath,
    required this.route,
    this.isDrawerMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close Sidebar
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: isDrawerMode ? Colors.white.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFFD4B579), width: 1),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath, 
              height: 20.h, 
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}