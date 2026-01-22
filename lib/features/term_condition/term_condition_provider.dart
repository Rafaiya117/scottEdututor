import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/features/term_condition/term_condition_controller.dart';

final TermConditionControllerProvider = Provider<TermConditionController>((ref) {
  return TermConditionController();
});