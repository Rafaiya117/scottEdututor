import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildChildCard(BuildContext context, {required String name, required String email, required bool isLinked, VoidCallback? onLink}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: isLinked ? const Color(0xFFFFE7BE) : Colors.white,
      border: Border.all(color: const Color(0xFFD0AD6B), width: 3.w),
      borderRadius: BorderRadius.circular(25.r),
    ),
    child: TextButton(
      onPressed: isLinked ? () => context.push('/child_prograss') : null,
      child: Row(
        children: [
          Container(
            height: 50.r, width: 50.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight,
                colors: isLinked 
                  ? [const Color(0xFFD4E157), const Color(0xFFB4D333)] 
                  : [const Color(0xFFFFB300), const Color(0xFFE68900)],
              ),
            ),
            child: Center(
              child: Text(name.isNotEmpty ? name[0].toUpperCase() : '',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 27.sp, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black), overflow: TextOverflow.ellipsis),
                Text(email, style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.black54), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (!isLinked) ...[
            GestureDetector(
              onTap: onLink,
              child: Text('Link', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black, decoration: TextDecoration.underline)),
            ),
            SizedBox(width: 8.w),
          ],
        ],
      ),
    ),
  );
}