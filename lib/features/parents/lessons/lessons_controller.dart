
import 'package:scoctt_edututo/features/parents/lessons/lessons_model.dart';

class LessonController {
  Lesson getLessonById(String id) {
    final lessons = [
      Lesson(
        id: 'alg2',
        title: 'Algebra II',
        content: 'Worksheet content goes here',
      ),
      Lesson(
        id: 'geo1',
        title: 'Geometry I',
        content: 'Worksheet content goes here',
      ),
    ];

    return lessons.firstWhere(
      (lesson) => lesson.id == id,
      orElse: () => Lesson(
        id: id,
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
                  Introduction to Linear Equations''',
      ),
    );
  }
}
