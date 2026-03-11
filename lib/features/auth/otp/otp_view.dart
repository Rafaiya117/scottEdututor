import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/componets/custom_button.dart';
import 'package:scoctt_edututo/core/componets/custom_otp_field.dart';
import 'package:scoctt_edututo/core/utils/background_template.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/auth/otp/otp_provider.dart';

class OtpView extends ConsumerWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = ref.read(otpControllerProvider);
    final email = GoRouterState.of(context).extra as String;
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
              length: 6,
              onCompleted: (otp) {
                print("OTP Entered: $otp");
              },
            ),
            SizedBox(height: 20.h),
            Consumer(
              builder: (context, ref, _) {
                final isLoading = ref.watch(otpLoadingProvider);

                return CustomButton(
                  buttontext: isLoading ? 'Verifying...' : 'Verify OTP',
                  buttonColor: const Color(0xFFD0AD6B),
                  buttonTextColor: Colors.white,
                  buttonHeight: 44.h,
                  buttonWidth: double.infinity,
                  ontap: () {
                    if (isLoading) return; 
                    if (otpController.isComplete(ref, 6)) {
                      ref.read(otpControllerProvider).verifyOtp(context,ref, email, );
                    } else {
                      showCustomSnackBar(
                        context,
                        "Please enter complete OTP",
                        CustomSnackType.error,
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
