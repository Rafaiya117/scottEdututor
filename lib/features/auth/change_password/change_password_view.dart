import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_auth_inputfield.dart';
import 'package:scoctt_edututo/core/componets/custom_button.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/auth/change_password/change_password_provider.dart';

class ChangePasswordView extends ConsumerWidget{
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final changePasswordController = ref.read(changePasswordControllerProvider);
    return BackgroundTemplate(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: (){
              context.pop();
            }, 
            icon: SvgPicture.asset(
              'assets/icons/back_icon.svg',
            )
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Change Password',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
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
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            CustomAuthInputfield(
              label: 'Old Password',
              hintText: '•••••',
              height: 44.h,
              width: double.infinity,
              controller: changePasswordController.oldpasswordController,
              isPassword: true,
              fillColor: Colors.white,
              iconcolor: Colors.grey,
              hintextclr: Colors.grey,
            ),
            SizedBox(height: 20.h),
            CustomAuthInputfield(
              label: 'New Password',
              hintText: '•••••',
              height: 44.h,
              width: double.infinity,
              controller: changePasswordController.newpasswordController,
              isPassword: true,
              fillColor: Colors.white,
              iconcolor: Colors.grey,
              hintextclr: Colors.grey,
            ),
            SizedBox(height: 20.h),
            CustomAuthInputfield(
              label: 'Confirm Password',
              hintText: '•••••',
              height: 44.h,
              width: double.infinity,
              controller: changePasswordController.confirmpasswordController,
              isPassword: true,
              fillColor: Colors.white,
              iconcolor: Colors.grey,
              hintextclr: Colors.grey,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              buttontext: 'Save Password',
              buttonColor: const Color(0xFFD0AD6B),
              buttonTextColor: Colors.white,
              buttonHeight: 44.h,
              buttonWidth: double.infinity,
              ontap: () {
                context.push('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
  