// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_view.dart';
import 'package:scoctt_edututo/features/Teacher/teacher_profile_view/teacher_profile_view.dart';
import 'package:scoctt_edututo/features/admin/admin_home/admin_home_view.dart';
import 'package:scoctt_edututo/features/admin/admin_profile/admin_profile.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_view.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/profile_view.dart';
import 'package:scoctt_edututo/features/settings/settings_view.dart';
import 'package:scoctt_edututo/features/student/student_home/student_home_view.dart';
import 'package:scoctt_edututo/features/student/student_profile/student_profile_view.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(bottomNavProvider);
    final role = ref.watch(selectedRoleProvider);

    if (role == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Widget currentScreen() {
      switch (selectedItem) {
        case BottomNavItem.home:
          switch (role.type) {
            case UserRoleType.teacher:
              return TeacherHomeView();
            case UserRoleType.parent:
              return ParentsView();
            case UserRoleType.student:
              return StudentHomeView();
            case UserRoleType.admin:
              return AdminHomeView();  
            }

        case BottomNavItem.profile:
          switch (role.type) {
            case UserRoleType.parent:
              return ParentsProfileView();
            case UserRoleType.student:
              return StudentProfileView();
            case UserRoleType.teacher:
              return TeacherProfileView();
            case UserRoleType.admin:
              return AdminProfileView();  
            }

        case BottomNavItem.settings:
          switch (role.type) {
            case UserRoleType.teacher:
              return const SettingsView();
            case UserRoleType.parent:
              return const SettingsView();
            default:
              return const SizedBox();
          }
        }
      }

    return Stack(
      children: [
        currentScreen(), 
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ReusableBottomNav(selectedItem: selectedItem),
        ),
      ],
    );
  }
}
