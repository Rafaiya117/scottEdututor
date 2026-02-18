import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/Teacher/class_management_view_more/class_management_view_more_model.dart';

final studentDetailsProvider = Provider.family<List<StudentDetail>, String>((ref, classId) {
  return [
    StudentDetail(
      name: 'Emma Rodriguez',
      email: 'emma.r@email.com',
      className: 'Class 1',
      courseName: 'Algebra II',
    ),
    StudentDetail(
      name: 'James Wilson',
      email: 'j.wilson@email.com',
      className: 'Class 1',
      courseName: 'Algebra II',
    ),
  ];
});