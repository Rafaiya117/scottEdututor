import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_provider.dart';

final TextEditingController emailController = TextEditingController();
List<Map<String, dynamic>> addedChildren = [];

void showAddChildDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(20.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add Child', style: GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
            ],
          ),
          Text('Enter your child\'s email to link their account', 
               style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.blueGrey)),
          SizedBox(height: 20.h),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFD9D9D9).withOpacity(0.5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
              hintText: 'mdjaoadulislam@gmail.com',
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.black))),
              SizedBox(width: 12.w),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD0AD6B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    final currentList = ref.read(addedChildrenProvider);
                    ref.read(addedChildrenProvider.notifier).state = [
                      ...currentList,
                      {
                        "name": emailController.text.split('@')[0],
                        "email": emailController.text,
                        "isLinked": false,
                      }
                    ];
                    emailController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit', style: GoogleFonts.poppins(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}