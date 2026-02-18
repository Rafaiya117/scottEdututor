import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_model.dart';
import 'package:file_picker/file_picker.dart';


class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController questionsController = TextEditingController();

  Future<void> pickFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        state = state.copyWith(
          uploadedFiles: [...state.uploadedFiles, ...result.files],
        );
      }
    } catch (e) {
      print("File picking error: $e");
    }
  }

  void removeFile(PlatformFile file) {
    state = state.copyWith(
      uploadedFiles: state.uploadedFiles.where((f) => f != file).toList(),
    );
  }

  void addQuiz(QuizModel quiz) {
    state = state.copyWith(
      quizzes: [...state.quizzes, quiz],
      uploadedFiles: [], 
    );
  }

  void deleteQuiz(int index) {
    final list = List<QuizModel>.from(state.quizzes);
    list.removeAt(index);
    state = state.copyWith(quizzes: list);
  }

  void addBlankQuestion(int quizIndex) {
    final List<QuizModel> updatedQuizzes = List.from(state.quizzes);
    final quiz = updatedQuizzes[quizIndex];

    final newQuestion = QuestionModel(
      questionText: '',
      options: ['', '', '', ''],
      correctOptionIndex: 0,
      points: 10,
    );

    // Calculate new question count safely
    int currentCount = int.tryParse(quiz.totalQuestions) ?? 0;

    updatedQuizzes[quizIndex] = QuizModel(
      quizName: quiz.quizName,
      totalPoints: quiz.totalPoints,
      totalQuestions: (currentCount + 1).toString(),
      className: quiz.className,
      courseName: quiz.courseName,
      questions: [...quiz.questions, newQuestion],
    );

    // Update the state
    state = state.copyWith(quizzes: updatedQuizzes);
  }
}