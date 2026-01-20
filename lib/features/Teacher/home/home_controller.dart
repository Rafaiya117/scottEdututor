import 'package:scoctt_edututo/features/Teacher/home/home_model.dart';

class TeacherHomepageController {
  List<ClassCategory> getClassCategory(){
    return const [
      ClassCategory(
        id: 'alg1',
        name: 'Algebra 1',
        svgPath: 'assets/icons/algebra.svg',
      ),
      ClassCategory(
        id: 'eng',
        name: 'English',
        svgPath: 'assets/icons/english.svg',
      ),
    ];
  }
}