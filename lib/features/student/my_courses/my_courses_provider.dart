import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_coureses_model.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_courses_controller.dart';

final StudentlessonProvider = StateProvider<MyCoursesController>((ref) => MyCoursesController());

//!-----  Enroll Test Provider ----------!
final quizProvider = StateNotifierProvider<QuizNotifier, List<Question>>((ref) {
  return QuizNotifier();
});