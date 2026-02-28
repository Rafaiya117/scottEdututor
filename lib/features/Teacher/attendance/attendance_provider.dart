import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attandance_model.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attendance_controller.dart';

final attendanceControllerProvider = Provider((ref) => AttendanceController());
final attendanceListProvider = StateProvider<List<AttandanceModel>>((ref) {
  return ref.watch(attendanceControllerProvider).getInitialData();
});