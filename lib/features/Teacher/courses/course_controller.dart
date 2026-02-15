import 'package:scoctt_edututo/features/Teacher/courses/course_model.dart';

class CourseController {
  Courses getLessonById(String id) {
    final courses = [
      Courses(
        id: 'alg2',
        title: 'Algebra II',
        content: '''
          Unit 1: Linear Functions & Systems
                  Introduction to Linear Equations
                  Solving Linear Equations
                  Introduction to Linear Equations
                  Introduction to Linear Equations
          Unit 2: Quadratic Functions
                  Introduction to Linear Equations
                  Solving Linear Equations
                  Introduction to Linear Equations
                  Introduction to Linear Equations
          Unit 1: Linear Functions & Systems
                  Introduction to Linear Equations
                  Solving Linear Equations
                  Introduction to Linear Equations
                  Introduction to Linear Equations
          Unit 2: Quadratic Functions
                  Introduction to Linear Equations
                  Solving Linear Equations
                  Introduction to Linear Equations
                  Introduction to Linear Equations
          Unit 1: Linear Functions & Systems
                  Introduction to Linear Equations
                  Solving Linear Equations
                  Introduction to Linear Equations
                  Introduction to Linear Equations''', // Real content moved here
      ),
      Courses(
        id: 'geo1',
        title: 'Geometry I',
        content: 'Geometry content goes here',
      ),
    ];

    return courses.firstWhere(
      (lesson) => lesson.id == id,
      orElse: () => Courses(
        id: 'error',
        title: 'Course Not Found',
        content: 'No content available for this ID.',
      ),
    );
  }
}
