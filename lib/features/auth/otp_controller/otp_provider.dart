import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/auth/otp_controller/otp_controller.dart';

final otpProvider = StateProvider<String>((ref) => '');
final otpControllerProvider = Provider<OTPController>((ref) {
  return OTPController();
});
