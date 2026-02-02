import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_profile_field_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/parent_profile_provider.dart';

class ParentsProfileView extends ConsumerWidget {
  ParentsProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(parentsProfileEditProvider);
    final controller = ref.read(parentsProfileControllerProvider);

    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/arrow_back.svg',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 90.w),
                        Text(
                          'Profile',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Divider(color: Colors.white, thickness: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            /// Avatar (unchanged)
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: const AssetImage(
                      'assets/images/profile_image4.png',
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 2,
                    child: SvgPicture.asset(
                      'assets/icons/camera.svg',
                      width: 18.w,
                      height: 18.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Emma Johnson',
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            /// 🔹 Personal Info Container (ADDED)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFF6F655A),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Information',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(parentsProfileEditProvider.notifier).state = !isEditing;
                        },
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          width: 16.w,
                          height: 16.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  profileField(
                    label: 'Full Name',
                    controller: controller.nameCtrl,
                    enabled: isEditing,
                  ),
                  profileField(
                    label: 'Relation',
                    controller: controller.relationCtrl,
                    enabled: isEditing,
                  ),
                  profileField(
                    label: 'Email',
                    controller: controller.emailCtrl,
                    enabled: isEditing,
                  ),
                  profileField(
                    label: 'Phone No:',
                    controller: controller.phoneCtrl,
                    enabled: isEditing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
