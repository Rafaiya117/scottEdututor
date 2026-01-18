import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/auth/login/login_controller.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);
final loginControllerProvider = Provider<LoginController>((ref) {
  final controller = LoginController();

  // Optional: auto dispose when widget is destroyed
  ref.onDispose(() {
    controller.emailController.dispose();
    controller.passwordController.dispose();
  });

  return controller;
});
