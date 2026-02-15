import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/admin/classes/class_controller.dart';
import 'package:scoctt_edututo/features/admin/classes/class_model.dart';

final classControllerProvider = Provider((ref) => ClassController());

final classListProvider = StateProvider<List<ClassModel>>((ref) {
  final controller = ref.watch(classControllerProvider);
  return controller.getInitialData();
});