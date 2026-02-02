import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCard extends ConsumerWidget {
  final String title;
  final List<Widget> children;
  final Color backgroundColor;

  const ReusableCard({
    super.key,
    required this.title,
    required this.children,
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFBAB9B9),
            ),
            SizedBox(height: 8.h),
            ...children, 
          ],
        ),
      ),
    );
  }
}