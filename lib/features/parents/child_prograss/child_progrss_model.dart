class QuizResult {
  final String title;
  final String score;

  QuizResult({
    required this.title,
    required this.score,
  });
}

class Course {
  final String id; // new
  final String title;
  final String lessons;

  Course({
    required this.id,
    required this.title,
    required this.lessons,
  });
}


class ChildProgressState {
  final int totalScore;
  final int enrolledCourses;
  final int progressPercent;
  final List<QuizResult> recentQuizzes;
  final List<Course> courses;

  ChildProgressState({
    required this.totalScore,
    required this.enrolledCourses,
    required this.progressPercent,
    required this.recentQuizzes,
    required this.courses,
  });
}
