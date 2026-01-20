import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/auth/login/login_provider.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void toggleRememberMe(WidgetRef ref, bool? value) {
    ref.read(rememberMeProvider.notifier).state = value ?? false;
  }
}