import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/student/attendance/attendance_model.dart';

final attendanceProvider = Provider<List<StudentAttendance>>((ref) {
  return List.generate(12, (index) => StudentAttendance(
    name: "ALEX DENIAL",
    email: "student@demo.com",
    isPresent: true,
  ));
});