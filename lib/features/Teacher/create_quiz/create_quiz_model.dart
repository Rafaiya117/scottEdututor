//!-----------1----------!
class QuizModel {
  final String quizName;
  final String courseName;
  final String className;
  final String totalQuestions;
  final String totalPoints;
  final List<QuestionModel> questions; // Added this

  QuizModel({
    required this.quizName,
    required this.courseName,
    required this.className,
    required this.totalQuestions,
    required this.totalPoints,
    this.questions = const [],
  });
}

class QuestionModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final int points;

  QuestionModel({
    required this.questionText, 
    required this.options, 
    required this.correctOptionIndex, 
    this.points = 10,
  });
}