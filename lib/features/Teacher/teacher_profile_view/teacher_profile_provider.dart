import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_profile_view/teacher_profile_controller.dart';

final TeacherProfileEditProvider = StateProvider<bool>((ref) => false);
final TeacherProfileControllerProvider = Provider((ref) => TeacherProfileController());