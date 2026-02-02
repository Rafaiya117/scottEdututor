import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/parent_profile_controller.dart';

final parentsProfileEditProvider = StateProvider<bool>((ref) => false);
final parentsProfileControllerProvider = Provider((ref) => ParentsProfileController());