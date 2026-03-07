import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/auth/login/login_provider.dart';


class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void toggleRememberMe(WidgetRef ref, bool? value) {
    ref.read(rememberMeProvider.notifier).state = value ?? false;
  }

  Future<void> login(BuildContext context, WidgetRef ref) async {
    try {
      final auth = await ref.read(authServiceProvider).login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final rememberMe = ref.read(rememberMeProvider);
      if (rememberMe) {
        await TokenStorage.saveAuth(auth);
      }
      showCustomSnackBar(
        context,
        "Login successful",
        CustomSnackType.success,
      );

      if (context.mounted) {
        context.push('/main');
      }
    } on DioException catch (e) {
      String message = "Login failed";

      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;

        if (data is Map && data.containsKey('message')) {
          message = data['message'];
        } else if (data is Map && data.containsKey('detail')) {
          message = data['detail'];
        }
      }
      showCustomSnackBar(
        context,
        message,
        CustomSnackType.error,
      );
    }
  }
}