import 'package:scoctt_edututo/features/Teacher/class_management/class_management_model.dart';

class ClassManagementController {

  List<ClassCategory2> getClassCategory(){
    return const [
      ClassCategory2(
        id: 'alg',
        name: 'Algebra I ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory2(
        id: 'eng',
        name: 'English I ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory2(
        id: 'algII',
        name: 'Algebra II ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory2(
        id: 'eng2',
        name: 'English II ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory2(
        id: 'his',
        name: 'History I ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
      ClassCategory2(
        id: 'his2',
        name: 'History II ',
        svgPath: 'assets/icons/arrow_forward.svg',
      ),
    ];
  }
}