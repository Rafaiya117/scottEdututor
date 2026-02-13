import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_coureses_model.dart';

class MyCoursesController {
  static final courseProvider = Provider<List<CourseModel>>((ref) {
    return [
      const CourseModel(name: 'Algebra II', lessons: '4 lessons', status: CourseStatus.learning, backgroundColor: Color(0xFFFFFFFF)),
      const CourseModel(name: 'Algebra II', lessons: '4 lessons', status: CourseStatus.enrollNow, backgroundColor: Color(0xFFFFFFFF)),
      const CourseModel(name: 'Algebra II', lessons: '4 lessons', status: CourseStatus.enrollNow, backgroundColor: Color(0xFFFFFFFF)),
      const CourseModel(name: 'English Literature 9', lessons: '4 lessons', status: CourseStatus.enrollNow, backgroundColor: Color(0xFFFFFFFF)),
      const CourseModel(name: 'English Literature 9', lessons: '4 lessons', status: CourseStatus.learning, backgroundColor: Color(0xFFFFFFFF)),
    ];
  });

  //!------- Lessons View ------!
  StudentLesson getLessonById(String id) {
    final lessons = [
      StudentLesson(
        id: 'alg2',
        title: 'Algebra II',
        content: 'Worksheet content goes here',
      ),
      StudentLesson(
        id: 'geo1',
        title: 'Geometry I',
        content: 'Worksheet content goes here',
      ),
    ];

    return lessons.firstWhere(
      (lesson) => lesson.id == id,
      orElse: () => StudentLesson(
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