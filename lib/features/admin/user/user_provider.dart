import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/admin/user/user_controller.dart';
import 'package:scoctt_edututo/features/admin/user/user_model.dart';

final userProvider = StateNotifierProvider<UserController, List<AppUser>>((ref) {
  return UserController();
});