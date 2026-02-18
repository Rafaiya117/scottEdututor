//!-----------1----------!
class QuizModel {
  final String quizName;
  final String totalPoints;
  final String totalQuestions;
  final String className;
  final String courseName;
  final List<QuestionModel> questions; 

  QuizModel({
    required this.quizName,
    required this.totalPoints,
    required this.totalQuestions,
    required this.className,
    required this.courseName,
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