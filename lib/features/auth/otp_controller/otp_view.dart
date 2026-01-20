import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/custom_button.dart';
import 'package:scoctt_edututo/core/componets/custom_otp_field.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/features/auth/otp_controller/otp_provider.dart';

class OtpView extends ConsumerWidget {
  OtpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = ref.read(otpControllerProvider);

    return BackgroundTemplate(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_one.png',
              width: 79.w,
              height: 79.h,
            ),
            SizedBox(height: 20.h),
            Text(
              'OTP',
              style: GoogleFonts.montserrat(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '',
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            OTPTextField(
              length: 4,
              onCompleted: (otp) {
                print("OTP Entered: $otp");
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              buttontext: 'Get OTP',
              buttonColor: const Color(0xFFD0AD6B),
              buttonTextColor: Colors.white,
              buttonHeight: 44.h,
              buttonWidth: double.infinity,
              ontap: () {
                if (otpController.isComplete(ref, 4)) {
                  final otp = otpController.getOtp(ref);
                  debugPrint("Submitting OTP: $otp");
                } else {
                  debugPrint("OTP not complete yet");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
