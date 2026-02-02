import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/parents/lessons/lessons_controller.dart';

final lessonProvider = StateProvider<LessonController>((ref) => LessonController());
