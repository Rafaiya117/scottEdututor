import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/privacy/privacy_controller.dart';

final PrivacyControllerProvider = Provider<PrivacyController>((ref) {
  return PrivacyController();
});