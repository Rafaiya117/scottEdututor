import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/student/student_profile/student_profile_controller.dart';

final studentProfileEditProvider = StateProvider<bool>((ref) => false);
final studentProfileControllerProvider = Provider((ref) => StudentProfileController());