import 'package:scoctt_edututo/features/parents/child_prograss/child_progrss_model.dart';

class ChildProgressController {

  ChildProgressState getChildProgress() {
    return ChildProgressState(
      totalScore: 80,
      enrolledCourses: 5,
      progressPercent: 85,
      recentQuizzes: [
        QuizResult(title: 'Math Quiz', score: '85/100'),
        QuizResult(title: 'English Quiz', score: '95/100'),
      ],
      courses: [
        Course(title: 'Algebra 1', lessons: '4 lessons', id: 'alg1'),
        Course(title: 'English Basics', lessons: '5 lessons', id: 'eng'),
      ],
    );
  }
}
