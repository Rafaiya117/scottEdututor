import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/auth/otp_controller/otp_provider.dart';

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
}
