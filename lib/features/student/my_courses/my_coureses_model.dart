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

//!--------- Enroll Test Model -------!
class Question {
  final String title;
  final List<String> options;
  final int? selectedOptionIndex;
  final int points;

  Question({
    required this.title,
    required this.options,
    this.selectedOptionIndex,
    this.points = 10,
  });

  // Helper to update the selection
  Question copyWith({int? selectedOptionIndex, int? points}) {
    return Question(
      title: title,
      options: options,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      points: points ?? this.points,
    );
  }
}