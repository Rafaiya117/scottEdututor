import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/create_quiz/create_quiz_model.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_model.dart';
import 'package:file_picker/file_picker.dart';


class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController questionsController = TextEditingController();
  final TextEditingController dateController = TextEditingController(); 
  final TextEditingController timeController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  
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

  void deleteQuiz(int index) {
    final list = List<QuizModel>.from(state.quizzes);
    list.removeAt(index);
    state = state.copyWith(quizzes: list);
  }

  void addTempQuestion() {
    final newQuestion = QuestionModel(
      questionText: '',
      options: ['', '', '', ''],
      correctOptionIndex: 0,
      points: 10,
    );
    state = state.copyWith(
      tempQuestions: [...state.tempQuestions, newQuestion],
    );
  }

  void addQuiz(QuizModel quiz) {
    state = state.copyWith(
      quizzes: [...state.quizzes, quiz],
      uploadedFiles: [],
      tempQuestions: [], 
    );
    nameController.clear();
    questionsController.clear();
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

    updatedQuizzes[quizIndex] = QuizModel(
      quizName: quiz.quizName,
      totalPoints: quiz.totalPoints,
      totalQuestions: (quiz.questions.length + 1).toString(),
      className: quiz.className,
      courseName: quiz.courseName,
      questions: [...quiz.questions, newQuestion],
    );
    state = state.copyWith(quizzes: updatedQuizzes);
  }
}