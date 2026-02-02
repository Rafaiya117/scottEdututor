import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/config/seetings_route.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_view.dart';
import 'package:scoctt_edututo/features/auth/change_password/change_password_view.dart';
import 'package:scoctt_edututo/features/auth/forgot_password/forgot_password_view.dart';
import 'package:scoctt_edututo/features/auth/login/login_view.dart';
import 'package:scoctt_edututo/features/auth/otp_controller/otp_view.dart';
import 'package:scoctt_edututo/features/parents/child_prograss/child_progrss_view.dart';
import 'package:scoctt_edututo/features/parents/lessons/lessons_view.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_view.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/profile_view.dart';
import 'package:scoctt_edututo/features/parents/prograss_details/prograss_details_view.dart';
import 'package:scoctt_edututo/features/privacy/privacy_view.dart';
import 'package:scoctt_edututo/features/settings/settings_view.dart';
import 'package:scoctt_edututo/features/splash_screen.dart';
import 'package:scoctt_edututo/features/term_condition/term_condition_view.dart';
import 'package:scoctt_edututo/features/user_role/user_role_model.dart';
import 'package:scoctt_edututo/features/user_role/user_role_view.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/user_roloe_selection',
        builder: (context, state) => RoleSelectionView(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainScaffold(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/forgot_password',
        builder: (context, state) => ForgotPasswordView(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => OtpView(),
      ),
      GoRoute(
        path: '/change_password',
        builder: (context, state) => ChangePasswordView(),
      ),

      //!------------- Parents ---------------------!

      GoRoute(
        path: '/parents_home',
        builder: (context, state) => ParentsView(),
      ),
      GoRoute(
        path: '/child_prograss',
        builder: (context, state) => ChildProgrssView(),
      ),
      // 
      GoRoute(
        path: '/lesson_view/:id',
        builder: (context, state) {
          final lessonId = state.pathParameters['id']!;
          return LessonView(lessonId: lessonId); 
        },
      ),
      GoRoute(
        path: '/prograss_details',
        builder: (context, state) => PrograssDetails(),
      ),
      GoRoute(
        path: '/parents_profile',
        builder: (context, state) => ParentsProfileView(),
      ),

      //!------------- Teacher Settings ------------!
      GoRoute(
        path: '/teacher_settings',
        builder: (context, state) => OtpView(),
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) => PrivacyView(),
      ),
      GoRoute(
        path: '/terms',
        builder: (context, state) => TermConditionView(),
      ),
    ],
  );
});


// Role-based screens mapping
final Map<UserRoleType, Map<BottomNavItem, Widget>> roleScreens = {
  UserRoleType.student: {
    //BottomNavItem.home: StudentHomeScreen(),
    //BottomNavItem.profile: StudentProfileScreen(),
    //BottomNavItem.settings: StudentSettingsScreen(),
  },
  UserRoleType.teacher: {
    BottomNavItem.home: TeacherHomeView(),
    //BottomNavItem.profile: TeacherProfileScreen(),
    BottomNavItem.settings: SettingsView(),
  },
  UserRoleType.parent: {
    BottomNavItem.home: ParentsView(),
    BottomNavItem.profile: ParentsProfileView(),
    //BottomNavItem.settings: ParentSettingsScreen(),
  },
  UserRoleType.admin: {
    //BottomNavItem.home: AdminHomeScreen(),
    //BottomNavItem.profile: AdminProfileScreen(),
    //BottomNavItem.settings: AdminSettingsScreen(),
  },
};