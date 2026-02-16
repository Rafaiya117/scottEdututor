import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/utils/side_bar/model.dart';
import 'package:scoctt_edututo/core/utils/side_bar/widget/custom_item_card.dart';

class CustomSidebar extends StatelessWidget {
  final List<SidebarItem> items;

  const CustomSidebar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    const Color(0xFFB39F7D).withOpacity(0.9),
                    const Color(0xFF5D533E).withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  // Header Logo
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        const Icon(Icons.local_fire_department, color: Color(0xFFD4B579)),
                        SizedBox(width: 8.w),
                        Text(
                          'OHR YISROEL',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Menu Items
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: StatCard(
                            title: item.title,
                            svgPath: item.svgPath,
                            route: item.route,
                            isDrawerMode: true,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h), 
        ],
      ),
    );
  }
}