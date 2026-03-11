import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/cusmon_snackbar.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/core/utils/snackbar_helper.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_provider.dart';

class ClassManagementController {
  // Active classes (detail page)
  final List<ClassInfo> _activeClasses = [];
  List<ClassInfo> getActiveClasses() => _activeClasses;

  // Categories for the view page (only id & name)
  final List<ClassCategory2> _categories = [];
  List<ClassCategory2> getClassCategory() => _categories;

  final TextEditingController addStudentClassController = TextEditingController();
  final TextEditingController addStudentCourseController = TextEditingController();

  String selectedStudentEmail = '';

  final ValueNotifier<bool> isLoaded = ValueNotifier(false);

  final List<String> studentEmailList = [];

  // 🔹 email -> studentId mapping
  final Map<String, int> studentEmailIdMap = {};

  void setStudentEmail(String email) {
    selectedStudentEmail = email;
  }

  void disposeAddStudent() {
    addStudentClassController.dispose();
    addStudentCourseController.dispose();
  }

  //! ---------------- FETCH CLASSES ----------------
  Future<void> fetchClasses(WidgetRef ref) async {
    if (isLoaded.value) return;

    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final response = await dio.get(
        '/classes/my-classes/',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final List<dynamic> data = response.data;
      debugPrint('!------my classes $data -------!');

      _activeClasses.clear();
      _activeClasses.addAll(
        data.map(
          (item) => ClassInfo(
            id: item['id'].toString(),
            title: item['name'] ?? '',
            subject: item['learning_objective'] ?? '',
            description: item['learning_objective'] ?? '',
            enrolledCount: item['student_enrolled'].toString(),
            progress: item['average_progress']?.toString() ?? '',
            createdDate: '',
          ),
        ),
      );

      final categories = data.map(
        (item) => ClassCategory2(
          id: item['id'].toString(),
          name: item['name'] ?? '',
          svgPath: 'assets/icons/arrow_forward.svg',
        ),
      ).toList();
      _categories.clear();
      _categories.addAll(categories);

      if (categories.isNotEmpty) {
        ref.read(selectedClassCategory2Provider.notifier).state = categories.first;
      }

      isLoaded.value = true;
    } catch (e) {
      debugPrint("Error fetching classes: $e");
    }
  }

  //! ---------------- FETCH STUDENT EMAILS ----------------
  Future<void> fetchStudentEmails(WidgetRef ref) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final response = await dio.get(
        '/student/list/',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      final List<dynamic> data = response.data;
      debugPrint('!------student list $data -------!');

      studentEmailList.clear();
      studentEmailIdMap.clear();

      for (var item in data) {
        final email = item['email']?.toString() ?? '';
        final id = item['id'];

        if (email.isNotEmpty && id != null) {
          studentEmailList.add(email);
          studentEmailIdMap[email] = id;
        }
      }
    } catch (e) {
      debugPrint("Error fetching student emails: $e");
    }
  }

  //! ---------------- ENROLL STUDENT ----------------
  Future<void> enrollStudent({
  required BuildContext context,
  required WidgetRef ref,
  required String classId,
}) async {
  try {
    final dio = ref.read(dioProvider);
    final auth = await TokenStorage.getAuth();
    final token = auth?.access;

    debugPrint("------ ENROLL STUDENT START ------");
    debugPrint("Selected Email: $selectedStudentEmail");

    final studentId = studentEmailIdMap[selectedStudentEmail];
    debugPrint("Resolved Student ID: $studentId");

    if (studentId == null) {
      debugPrint("Student ID is NULL");
      showCustomSnackBar(
        context,
        "Please select a valid student",
        CustomSnackType.error,
      );
      return;
    }

    final body = {
      "student_ids": [studentId]
    };

    debugPrint("Class ID: $classId");
    debugPrint("Request Body: $body");

    final response = await dio.post(
      '/classes/$classId/add-students/',
      data: body,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    debugPrint("API Response: ${response.data}");

    final data = response.data;

    showCustomSnackBar(
      context,
      data['detail'] ?? "Student enrolled successfully",
      CustomSnackType.success,
    );

  } on DioException catch (e) {

    debugPrint("------ ENROLL ERROR ------");
    debugPrint("Dio Error: ${e.message}");
    debugPrint("Status Code: ${e.response?.statusCode}");
    debugPrint("Response Data: ${e.response?.data}");

    String message = "Failed to enroll student";

    if (e.response?.data != null) {
      final data = e.response?.data;

      if (data is Map && data.containsKey('detail')) {
        message = data['detail'];
      }
    }

    showCustomSnackBar(
      context,
      message,
      CustomSnackType.error,
    );

  } catch (e) {
    debugPrint("------ UNKNOWN ERROR ------");
    debugPrint(e.toString());

    showCustomSnackBar(
      context,
      "Something went wrong",
      CustomSnackType.error,
    );
  }
}
}