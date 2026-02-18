import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_profile_field_card.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_profile_view/teacher_profile_provider.dart';

class TeacherProfileView extends ConsumerWidget {
  TeacherProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(TeacherProfileControllerProvider);

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
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 90.w),
                        Text(
                          'Profile',
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    const Divider(color: Colors.white, thickness: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Added to prevent overflow on smaller screens
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
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
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Information',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push('/teacher_edit_profile');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/edit.svg',
                            width: 16.w,
                            height: 16.h,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    profileField(
                      label: 'Full Name',
                      controller: controller.nameCtrl,
                    ),
                    profileField(label: 'Id', controller: controller.id),
                    profileField(
                      label: 'Email',
                      controller: controller.emailCtrl,
                    ),
                    profileField(
                      label: 'Phone No:',
                      controller: controller.phoneCtrl,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
