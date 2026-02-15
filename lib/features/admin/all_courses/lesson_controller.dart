import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/admin/all_courses/lesson_model.dart';

final lessonProvider = Provider<CourseSyllabus>((ref) {
  return CourseSyllabus(
    courseName: 'Algebra II',
    units: [
      LessonUnit(
        unitTitle: 'Unit 1: Linear Functions & Systems',
        lessons: [
          'Introduction to Linear Equations',
          'Solving Linear Equations',
          'Introduction to Linear Equations',
          'Introduction to Linear Equations',
        ],
      ),
      LessonUnit(
        unitTitle: 'Unit 2: Quadratic Functions',
        lessons: [
          'Introduction to Linear Equations',
          'Solving Linear Equations',
          'Introduction to Linear Equations',
          'Introduction to Linear Equations',
        ],
      ),
      LessonUnit(
        unitTitle: 'Unit 1: Linear Functions & Systems',
        lessons: [
          'Introduction to Linear Equations',
          'Solving Linear Equations',
          'Introduction to Linear Equations',
          'Introduction to Linear Equations',
        ],
      ),
    ],
  );
});