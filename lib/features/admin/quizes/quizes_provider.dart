import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/admin/quizes/quiezes_model.dart';
import 'package:scoctt_edututo/features/admin/quizes/quizes_controller.dart';

final quizControllerProvider = Provider((ref) => QuizController());

final quizListProvider = StateProvider<List<QuizModel>>((ref) {
  final controller = ref.watch(quizControllerProvider);
  return controller.getInitialData();
});