import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_provider.dart';


class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(bottomNavProvider);
    final role = ref.watch(selectedRoleProvider);

    Widget currentScreen() {
      switch (selectedItem) {
        case BottomNavItem.home:
          switch (role) {
            case UserRoleType.student:
              //return const StudentHomeScreen();
            case UserRoleType.teacher:
              //return const TeacherHomeScreen();
            case UserRoleType.parent:
              //return const ParentHomeScreen();
          }
        case BottomNavItem.profile:
          //return const ProfileScreen();
        case BottomNavItem.settings:
          //return const SettingsScreen();
      }
      return const SizedBox();
    }

    return Scaffold(
      body: currentScreen(),               
      bottomNavigationBar: const ReusableBottomNav(), 
    );
  }
}
