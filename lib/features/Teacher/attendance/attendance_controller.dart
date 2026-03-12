
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attandance_model.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attendance_provider.dart';

class AttendanceController {

  List<AttandanceModel> getInitialData() {
    return [];
  }

  Future<void> fetchAttendance({required WidgetRef ref,required String classId,required DateTime date,}) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final formattedDate = DateFormat('yyyy-MM-dd').format(date);

      final response = await dio.get(
        '/classes/$classId/attendance/',
        queryParameters: {
          'date': formattedDate,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      debugPrint("Attendance API response: ${response.data}");

      final List students = response.data['students'];
      final attendanceList = students.map((e) => AttandanceModel.fromJson(e)).toList();

      ref.read(attendanceListProvider.notifier).state = List<AttandanceModel>.from(attendanceList);

    } catch (e) {
      debugPrint("Attendance fetch error: $e");
    }
  }
  //!------- Submit Attendance -----------!
  Future<void> submitAttendance({
  required WidgetRef ref,
  required String classId,
  required DateTime date,
}) async {
  try {
    final dio = ref.read(dioProvider);
    final auth = await TokenStorage.getAuth();
    final token = auth?.access;

    final formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final attendanceList = ref.read(attendanceListProvider);

    final attendances = attendanceList.map((student) {
      return {
        "student_id": student.studentId,
        "status": student.status.toLowerCase(),
      };
    }).toList();

    final body = {
      "class_id": int.parse(classId),
      "date": formattedDate,
      "attendances": attendances,
    };

    final response = await dio.post(
      "/classes/attendance/submit/",
      data: body,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    debugPrint("Submit attendance response: ${response.data}");

    // Reload attendance after submit
    await fetchAttendance(
      ref: ref,
      classId: classId,
      date: date,
    );

  } catch (e) {
    debugPrint("Submit attendance error: $e");
  }
}
}