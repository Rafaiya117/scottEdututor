import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_controller.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';

final selectedClassCategory2Provider = StateProvider<ClassCategory2?>((ref) => null);
final classmanagementController = Provider((ref) => ClassManagementController());