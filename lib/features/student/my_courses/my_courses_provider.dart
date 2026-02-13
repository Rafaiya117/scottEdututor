import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_courses_controller.dart';

final StudentlessonProvider = StateProvider<MyCoursesController>((ref) => MyCoursesController());