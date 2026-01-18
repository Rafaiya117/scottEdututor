import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';

final selectedRoleProvider = StateProvider<UserRole?>((ref) => null);
final userRoleProvider = StateProvider<UserRoleType>((ref) => UserRoleType.student);