import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/auth/otp/otp_provider.dart';

class OTPController {
  void setOtp(WidgetRef ref, String value) {
    ref.read(otpProvider.notifier).state = value;
  }

  String getOtp(WidgetRef ref) {
    return ref.read(otpProvider);
  }

  bool isComplete(WidgetRef ref, int length) {
    return getOtp(ref).length == length;
  }

  void clear(WidgetRef ref) {
    ref.read(otpProvider.notifier).state = '';
  }

  // ---------------- VERIFY OTP WITH LOADER ----------------
  Future<void> verifyOtp(BuildContext context,WidgetRef ref,String email,) async {
    try {
      // Start loader
      ref.read(otpLoadingProvider.notifier).state = true;
      final otp = getOtp(ref);

      final resetToken = await ref.read(authServiceProvider).verifyOtp(
        email: email,
        otp: otp,
      );
      
      // Stop loader
      ref.read(otpLoadingProvider.notifier).state = false;

      showCustomSnackBar(context,"OTP Verified Successfully",CustomSnackType.success,);
      debugPrint("Reset Token: $resetToken");

      if (context.mounted) {
        context.push('/change_password',extra: resetToken,);
      }
    } on DioException catch (e) {
      ref.read(otpLoadingProvider.notifier).state = false;
      String message = "OTP verification failed";
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map && data.containsKey('detail')) {
          message = data['detail'];
        }
      }
      showCustomSnackBar(context,message,CustomSnackType.error,);
    } catch (_) {
      ref.read(otpLoadingProvider.notifier).state = false;
      showCustomSnackBar(context,"Something went wrong",CustomSnackType.error,);
    }
  }
}