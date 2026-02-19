import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_controller.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_model.dart';

final quizProvider = StateNotifierProvider<QuizController, QuizState>((ref) {
  return QuizController();
});

final selectedCourseProvider = StateProvider<String>((ref) => 'Select course...');
final selectedClassProvider = StateProvider<String>((ref) => 'All classes...');

