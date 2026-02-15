import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/admin/admin_profile/admin_profile_controller.dart';

final AdminProfileEditProvider = StateProvider<bool>((ref) => false);
final AdminProfileControllerProvider = Provider((ref) => AdminProfileController());