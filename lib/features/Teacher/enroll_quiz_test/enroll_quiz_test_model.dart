class QuizQuestion {
  String questionText;
  List<String> options;
  int? correctAnswerIndex;
  int points;

  QuizQuestion({
    this.questionText = '',
    List<String>? options,
    this.correctAnswerIndex,
    this.points = 10,
  }) : options = options ?? ['', '', '', ''];
}

class QuizState {
  final List<QuizQuestion> questions;
  final String quizName;
  final String passingScore;

  QuizState({
    required this.questions,
    this.quizName = '',
    this.passingScore = '75',
  });

  QuizState copyWith({List<QuizQuestion>? questions, String? quizName, String? passingScore}) {
    return QuizState(
      questions: questions ?? this.questions,
      quizName: quizName ?? this.quizName,
      passingScore: passingScore ?? this.passingScore,
    );
  }
}