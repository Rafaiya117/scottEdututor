import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';

class CourseController {
  Future<Courses?> getLessonById({required WidgetRef ref, required String id}) async {
    return await fetchCourseById(ref: ref, courseId: id);
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
}