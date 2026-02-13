import 'package:scoctt_edututo/features/student/quizes/quizes_model.dart';

class QuiezController {
  List<ClassCategory> getClassCategory(){
    return const [
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory(
        id: 'whq',
        name: 'World History Quiz ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
    ];
  }

  //!----- Quiz Questions -------!
   List<RadioOption<int>> getOptions() {
    return [
      RadioOption(value: 1, label: 'Option 1'),
      RadioOption(value: 2, label: 'Option 2'),
      RadioOption(value: 3, label: 'Option 3'),
      RadioOption(value: 4, label: 'Option 4'),
    ];
  }

  List<Map<String, dynamic>> getQuizData() {
    return [
      {
        'id': 1,
        'question': 'Question 1',
        'points': '10',
        'options': getOptions(),
      },
      {
        'id': 2,
        'question': 'Question 2',
        'points': '20',
        'options': getOptions(),
      },
    ];
  }
}