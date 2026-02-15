import 'package:scoctt_edututo/features/admin/classes/class_model.dart';

class ClassController {
  List<ClassModel> getInitialData() {
    return [
      ClassModel(
        title: 'Class 1',
        description: 'Advanced algebra concepts including polynomials, exponentials, and logarithms',
        students: 2,
        teachers: 4,
        courses: 4,
      ),
      ClassModel(
        title: 'Class 2',
        description: 'Advanced algebra concepts including polynomials, exponentials, and logarithms',
        students: 2,
        teachers: 4,
        courses: 4,
      ),
    ];
  }
}
