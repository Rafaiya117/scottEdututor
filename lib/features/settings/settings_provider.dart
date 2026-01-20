import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_controller.dart';

final settingsControllerProvider = Provider<SettingsController>((ref) {
  return SettingsController();
});
