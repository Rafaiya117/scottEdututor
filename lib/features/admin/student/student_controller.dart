import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/admin/student/student_model.dart';

final studentProvider = Provider<List<Student>>((ref) {
  return List.generate(
    10,
    (index) => Student(
      name: 'Emma Rodriguez',
      id: index == 0 ? '001' : '011',
      className: index == 0 ? 'Class-1' : (index == 5 ? 'Class-9' : 'Class-2'),
    ),
  );
});