import 'package:scoctt_edututo/features/admin/quizes/quiezes_model.dart';

class QuizController {
  List<QuizModel> getInitialData() {
    return [
      QuizModel(
        quizName: 'Algebra Quiz',
        totalPoints: '100 pts',
        totalQuestions: '20 Qs',
        className: 'Class 1',
        courseName: 'Mathematics',
      ),
      QuizModel(
        quizName: 'Logarithms Basics',
        totalPoints: '50 pts',
        totalQuestions: '10 Qs',
        className: 'Class 1',
        courseName: 'Mathematics',
      ),
    ];
  }
}