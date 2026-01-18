import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_view.dart';


final courseListProvider = StateProvider<List<CourseItem>>((ref) => const [
      CourseItem(id: '1', title: 'Introduction'),
      CourseItem(id: '2', title: 'Chapter 1'),
      CourseItem(id: '3', title: 'Chapter 2'),
    ]);
