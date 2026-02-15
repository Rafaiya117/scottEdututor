class LessonUnit {
  final String unitTitle;
  final List<String> lessons;

  LessonUnit({required this.unitTitle, required this.lessons});
}

class CourseSyllabus {
  final String courseName;
  final List<LessonUnit> units;

  CourseSyllabus({required this.courseName, required this.units});
}