import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_controller.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_model.dart';

final quizProvider = StateNotifierProvider<QuizController, QuizState>((ref) {
  return QuizController();
});


