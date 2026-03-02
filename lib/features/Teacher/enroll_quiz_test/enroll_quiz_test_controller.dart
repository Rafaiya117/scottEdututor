import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/Teacher/enroll_quiz_test/enroll_quiz_test_model.dart';


class QuizController extends Notifier<QuizState> {
  @override
  QuizState build() {
    return QuizState(questions: [QuizQuestion()]);
  }

  void addQuestion() {
    state = state.copyWith(questions: [...state.questions, QuizQuestion()]);
  }

  void removeQuestion(int index) {
    if (state.questions.length > 1) {
      final updatedList = List<QuizQuestion>.from(state.questions)..removeAt(index);
      state = state.copyWith(questions: updatedList);
    }
  }

  void updateQuestionText(int index, String text) {
    state.questions[index].questionText = text;
  }

  void updateOption(int qIndex, int oIndex, String text) {
    state.questions[qIndex].options[oIndex] = text;
  }
}

final quizProvider = NotifierProvider<QuizController, QuizState>(QuizController.new);