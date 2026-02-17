import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/student/quizes/quiez_controller.dart';
import 'package:scoctt_edututo/features/student/quizes/quizes_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final selectedClassCategoryProvider = StateProvider<ClassCategory?>((ref) => null);

final quizControllerProvider = Provider((ref) => QuiezController());
final selectedRadioProvider = StateProvider<Map<int, int?>>((ref) => {});