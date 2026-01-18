import 'package:scoctt_edututo/core/sidebarmenu/sidebar_menu_model.dart';

class SidebarMenuController {
  List<MenuItemType> get menuItems => [
        MenuItemType.dashboard,
        MenuItemType.myClasses,
        MenuItemType.courses,
        MenuItemType.assignments,
        MenuItemType.quizzesAndTests,
        MenuItemType.reports,
      ];

  String routeFor(MenuItemType item) {
    switch (item) {
      case MenuItemType.dashboard:
        return '/dashboard';
      case MenuItemType.myClasses:
        return '/my-classes';
      case MenuItemType.courses:
        return '/courses';
      case MenuItemType.assignments:
        return '/assignments';
      case MenuItemType.quizzesAndTests:
        return '/quizzes';
      case MenuItemType.reports:
        return '/reports';
    }
  }

  String labelFor(MenuItemType item) {
    switch (item) {
      case MenuItemType.dashboard:
        return 'Dashboard';
      case MenuItemType.myClasses:
        return 'My Classes';
      case MenuItemType.courses:
        return 'Courses';
      case MenuItemType.assignments:
        return 'Assignments';
      case MenuItemType.quizzesAndTests:
        return 'Quizzes & Tests';
      case MenuItemType.reports:
        return 'Reports';
    }
  }

  String getIconForMenu(MenuItemType item) {
    switch (item) {
      case MenuItemType.dashboard:
        return 'assets/icons/dashboard.svg';
      case MenuItemType.myClasses:
        return 'assets/icons/classes.svg';
      case MenuItemType.courses:
        return 'assets/icons/courses.svg';
      case MenuItemType.assignments:
        return 'assets/icons/assignment.svg';
      case MenuItemType.quizzesAndTests:
        return 'assets/icons/quiz.svg';
      case MenuItemType.reports:
        return 'assets/icons/reports.svg';
    }
  }
}
