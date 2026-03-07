import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/auth/change_password/change_password_provider.dart';

class ChangePasswordController {
  final TextEditingController oldpasswordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  Future<void> resetPassword(BuildContext context,WidgetRef ref,String resetToken,) async {
    try {
      ref.read(resetPasswordLoadingProvider.notifier).state = true;

      final message = await ref.read(authServiceProvider).resetPassword(
        resetToken: resetToken,
        newPassword: newpasswordController.text.trim(),
        confirmPassword: confirmpasswordController.text.trim(),
      );
      ref.read(resetPasswordLoadingProvider.notifier).state = false;
      showCustomSnackBar(context,message,CustomSnackType.success,);

      if (context.mounted) {
        context.pop();
      }
    } on DioException catch (e) {
      ref.read(resetPasswordLoadingProvider.notifier).state = false;
      String errorMessage = "Password reset failed";
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;

        if (data is Map && data.containsKey('detail')) {
          errorMessage = data['detail'];
        }
      }

      showCustomSnackBar(context,errorMessage,CustomSnackType.error,);
    } catch (_) {
      ref.read(resetPasswordLoadingProvider.notifier).state = false;
      showCustomSnackBar(context,"Something went wrong",CustomSnackType.error,);
    }
  }
}