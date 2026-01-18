import 'package:scoctt_edututo/features/Teacher/quiz/quiz_model.dart';

class QuizController {
  List<RadioOption<int>> getOptions() {
    return [
      RadioOption(value: 1, label: 'Option 1'),
      RadioOption(value: 2, label: 'Option 2'),
      RadioOption(value: 3, label: 'Option 3'),
      RadioOption(value: 4, label: 'Option 4'),
    ];
  }
}
