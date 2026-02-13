import 'dart:ui';

enum CourseStatus { learning, enrollNow }

class CourseModel {
  final String name;
  final String lessons;
  final CourseStatus status;
  final Color backgroundColor;

  const CourseModel({
    required this.name,
    required this.lessons,
    required this.status,
    required this.backgroundColor,
  });
}

//!---- Lesson model ------!
  class StudentLesson {
  final String id;
  final String title;
  final String content;

  StudentLesson({
    required this.id,
    required this.title,
    required this.content,
  });
}