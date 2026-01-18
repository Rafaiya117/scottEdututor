import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:scoctt_edututo/features/Teacher/quiz/quiz_controller.dart';

final quizControllerProvider = Provider((ref) => QuizController());
final selectedRadioProvider = StateProvider<int?>((ref) => null);
