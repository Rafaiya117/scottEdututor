import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/dio/dio_provider.dart';
import 'package:scoctt_edututo/core/dio/shared_preference/token_storage.dart';
import 'package:scoctt_edututo/features/Teacher/class_management_view_more/class_management_view_more_model.dart';

final studentDetailsProvider = FutureProvider.family<List<StudentDetail>, String>((ref, classId) async {
  try {
    final dio = ref.read(dioProvider);
    final auth = await TokenStorage.getAuth();
    final token = auth?.access;

    final response = await dio.get(
     '/classes/${classId.trim()}/students/',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    final List<dynamic> data = response.data;

    debugPrint("------ student details $data -------");

    return data.map((item) {
      return StudentDetail(
        name: "${item['first_name'] ?? ''} ${item['last_name'] ?? ''}".trim(),
        email: item['email'] ?? '',
        className: item['classes'] ?? '',
        courseName: item['classes'] ?? '',
      );
    }).toList();
  } catch (e) {
    debugPrint("Error fetching student details: $e");
    return [];
  }
});