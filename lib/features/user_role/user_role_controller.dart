import 'package:scoctt_edututo/features/user_role/user_role_model.dart';

class RoleSelectionController {

  List<UserRole> getRoles() {
    return const [
      UserRole(
        id: 'teacher',
        name: 'Teacher',
        svgPath: 'assets/icons/teacher_icon.svg',
      ),
      UserRole(
        id: 'student',
        name: 'Student',
        svgPath: 'assets/icons/student_icon.svg',
      ),
      UserRole(
        id: 'parent',
        name: 'Parent',
        svgPath: 'assets/icons/parent_icon.svg',
      ),
    ];
  }
}
