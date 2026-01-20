import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/auth/forgot_password/forgot_password_controller.dart';

final forgotPasswordControllerProvider = Provider<ForgotPasswordController>((ref){
  final controller = ForgotPasswordController();
  return controller;
});