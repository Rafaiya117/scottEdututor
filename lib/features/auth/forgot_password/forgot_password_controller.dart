import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/auth/forgot_password/forgot_password_provider.dart';

class ForgotPasswordController {
  final TextEditingController emailController = TextEditingController();
  Future<void> sendOtp(BuildContext context, WidgetRef ref) async {
    try {
      // Start loading
      ref.read(forgotPasswordLoadingProvider.notifier).state = true;
      final message = await ref.read(authServiceProvider).sendForgotPasswordOtp(
        emailController.text.trim(),
      );
      // Stop loading BEFORE navigation
      ref.read(forgotPasswordLoadingProvider.notifier).state = false;
      showCustomSnackBar(context,message,CustomSnackType.success,);

      if (context.mounted) {
        context.push('/otp', extra: emailController.text.trim());
      }
    } on DioException catch (e) {
      ref.read(forgotPasswordLoadingProvider.notifier).state = false;
      String errorMessage = "Failed to send OTP";

      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;

        if (data is Map && data.containsKey('detail')) {
          errorMessage = data['detail'];
        }
      }

      showCustomSnackBar(context,errorMessage,CustomSnackType.error,);
    } catch (_) {
      ref.read(forgotPasswordLoadingProvider.notifier).state = false;

      showCustomSnackBar(context,"Something went wrong",CustomSnackType.error,);
    }
  }
}