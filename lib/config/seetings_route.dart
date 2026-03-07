// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_view.dart';
import 'package:scoctt_edututo/features/admin/admin_home/admin_home_view.dart';
import 'package:scoctt_edututo/features/auth/auth_services/auth_provider/auth_provider.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_view.dart';
import 'package:scoctt_edututo/features/settings/settings_view.dart';
import 'package:scoctt_edututo/features/student/student_home/student_home_view.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(bottomNavProvider);
    final authAsync = ref.watch(authProvider);

    return authAsync.when(
      data: (auth) {
        if (auth == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        Widget currentScreen() {
          switch (selectedItem) {
            case BottomNavItem.home:
              switch (auth.userRole) {
                case 'teacher':
                  return TeacherHomeView();
                case 'parent':
                  return ParentsView();
                case 'student':
                  return StudentHomeView();
                case 'admin':
                  return AdminHomeView();
                default:
                  return const SizedBox();
              }

            case BottomNavItem.profile:
              return const SettingsView();

            case BottomNavItem.settings:
              return const SettingsView();
          }
        }

        return Stack(
          children: [
            currentScreen(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ReusableBottomNav(
                selectedItem: selectedItem,
              ),
            ),
          ],
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox(),
    );
  }
}