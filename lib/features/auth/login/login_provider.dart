import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/auth/login/login_controller.dart';

final rememberMeProvider = StateProvider<bool>((ref) => false);

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

final loginControllerProvider = Provider<LoginController>((ref) {
  final controller = LoginController();

  ref.onDispose(() {
    controller.emailController.dispose();
    controller.passwordController.dispose();
  });

  return controller;
});

