import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';

class CourseController {
  Future<Courses?> getLessonById({required WidgetRef ref, required String id}) async {
    return await fetchCourseById(ref: ref, courseId: id);
  }

  //!------------------Fetch Class ------------------
  Future<List<Map<String, dynamic>>> fetchMyClasses(WidgetRef ref) async {
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

    final List<dynamic> data = response.data['data'] ?? [];

    return data.map((c) => {
      "id": int.tryParse(c['class_id'].toString()) ?? 0, // parse as int
      "class_name": c['class_name'] ?? 'Unnamed Class',
    }).toList();
  } catch (e) {
    debugPrint("Error fetching teacher classes: $e");
    return [];
  }
}

  //! ---------------- FETCH COURSES ----------------
  Future<List<Courses>> fetchCourses(WidgetRef ref) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final response = await dio.get(
        '/course/list/',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> data = responseData['data'] ?? [];

      return data.map((item) => Courses.fromJson(item)).toList();
    } catch (e) {
      debugPrint("Error fetching courses: $e");
      return [];
    }
  }

  //!---------- Fetch by id -----------!
  Future<Courses?> fetchCourseById({required WidgetRef ref,required String courseId,}) async {
    try {
      final dio = ref.read(dioProvider);
      final auth = await TokenStorage.getAuth();
      final token = auth?.access;

      final response = await dio.get(
        '/course/$courseId/',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      debugPrint('------course details ${response.data} ------');

      // Extract the nested data object
      final courseData = response.data['data']; 

      if (courseData == null) return null;

      return Courses.fromJson(courseData);
    } catch (e) {
      debugPrint("Error fetching course details: $e");
      return null;
    }
  }

 Future<void> createCourseAndRefresh({
    required WidgetRef ref,
    required String name,
    required List<int> classIds,
    required List<PlatformFile> files,
  }) async {
    final dio = ref.read(dioProvider);
    final auth = await TokenStorage.getAuth();
    final token = auth?.access;

    final multipartFiles = files
        .where((f) => f.path != null)
        .map((f) => MultipartFile.fromFileSync(f.path!))
        .toList();

    final formData = FormData.fromMap({
      "name": name,
      "classes": classIds.map((e) => e.toString()).toList(),
      "files": multipartFiles.isEmpty ? [] : multipartFiles,
    });

    debugPrint(
      "DEBUG: FormData keys: ${formData.fields.map((f) => f.key).toList()}",
    );
    debugPrint("DEBUG: FormData files count: ${formData.files.length}");

    try {
      final response = await dio.post(
        '/course/create/',
        data: formData,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
          contentType: "multipart/form-data",
        ),
      );

      final courseId = response.data['data']['course_id'];

      while (true) {
        await Future.delayed(const Duration(seconds: 2));

        final statusRes = await dio.get(
          '/course/$courseId/status/',
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );

        final status = statusRes.data['data']['status'];
        if (status == "completed") break;
      }

      await fetchCourses(ref);
    } on DioException catch (e) {
      // ✅ DEBUG: print full response body and status code
      debugPrint("DEBUG: DioException statusCode: ${e.response?.statusCode}");
      debugPrint("DEBUG: DioException response data: ${e.response?.data}");
    }
  }
}
