import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/auth/change_password/change_password_controller.dart';

final passwordVisibilityProvider = StateProvider<bool>((ref) => false);

final changePasswordControllerProvider = Provider<ChangePasswordController>((ref) {
  final controller = ChangePasswordController();

  ref.onDispose(() {
    controller.oldpasswordController.dispose();
    controller.newpasswordController.dispose();
    controller.confirmpasswordController.dispose();
  });

  return controller;
});