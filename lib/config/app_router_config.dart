import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/config/seetings_route.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/Teacher/attendance/attendance_view.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_details.dart';
import 'package:scoctt_edututo/features/Teacher/class_management/class_management_view.dart';
import 'package:scoctt_edututo/features/Teacher/class_management_add_student/add_student_view.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_details_view.dart';
import 'package:scoctt_edututo/features/Teacher/courses/course_view.dart';
import 'package:scoctt_edututo/features/Teacher/home/home_view.dart';
import 'package:scoctt_edututo/features/Teacher/report_details/report_details_view.dart';
import 'package:scoctt_edututo/features/Teacher/report_details/report_table_view.dart';
import 'package:scoctt_edututo/features/admin/admin_profile/admin_profile.dart';
import 'package:scoctt_edututo/features/admin/all_courses/all_courses_view.dart';
import 'package:scoctt_edututo/features/admin/classes/class_view.dart';
import 'package:scoctt_edututo/features/admin/quizes/quize_details.dart';
import 'package:scoctt_edututo/features/admin/quizes/quizes_view.dart';
import 'package:scoctt_edututo/features/admin/student/student_view.dart';
import 'package:scoctt_edututo/features/admin/user/user_report.dart';
import 'package:scoctt_edututo/features/admin/user/user_view.dart';
import 'package:scoctt_edututo/features/admin/view_reports/view_report_details.dart';
import 'package:scoctt_edututo/features/admin/view_reports/view_reports.dart';
import 'package:scoctt_edututo/features/auth/change_password/change_password_view.dart';
import 'package:scoctt_edututo/features/auth/forgot_password/forgot_password_view.dart';
import 'package:scoctt_edututo/features/auth/login/login_view.dart';
import 'package:scoctt_edututo/features/auth/otp_controller/otp_view.dart';
import 'package:scoctt_edututo/features/parents/child_prograss/child_progrss_view.dart';
import 'package:scoctt_edututo/features/parents/lessons/lessons_view.dart';
import 'package:scoctt_edututo/features/parents/parents_home/parents_view.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/edit_parents_profile_view.dart';
import 'package:scoctt_edututo/features/parents/parents_profile/profile_view.dart';
import 'package:scoctt_edututo/features/parents/prograss_details/prograss_details_view.dart';
import 'package:scoctt_edututo/features/privacy/privacy_view.dart';
import 'package:scoctt_edututo/features/settings/settings_view.dart';
import 'package:scoctt_edututo/features/splash_screen.dart';
import 'package:scoctt_edututo/features/student/my_courses/my_corses_view.dart';
import 'package:scoctt_edututo/features/student/my_prograss/my_prograss_view.dart';
import 'package:scoctt_edututo/features/student/quizes/quiz_view.dart';
import 'package:scoctt_edututo/features/student/quizes/quize_ques.dart';
import 'package:scoctt_edututo/features/student/quizes/report_summery_view.dart';
import 'package:scoctt_edututo/features/student/student_home/student_home_view.dart';
import 'package:scoctt_edututo/features/student/student_profile/edit_student_info.dart';
import 'package:scoctt_edututo/features/student/student_profile/student_profile_view.dart';
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

      //!------------- student ---------------------!

      GoRoute(
        path: '/student_home_view',
        builder: (context, state) => StudentHomeView(),
      ),
      GoRoute(
        path: '/my_courses',
        builder: (context, state) => CourseTableView(),
      ),
      GoRoute(
        path: '/quizes',
        builder: (context, state) => StudentQuizView(),
      ),
      GoRoute(
        path: '/quiz_ques',
        builder: (context, state) => QuizeQues(),
      ),
      GoRoute(
        path: '/report_summery',
        builder: (context, state) => ReportSummeryView(),
      ),
      GoRoute(
        path: '/my_prograss',
        builder: (context, state) => MyPrograssView(),
      ),
      GoRoute(
        path: '/edit_student_info',
        builder: (context, state) => EditStudentInfo(),
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
      GoRoute(
        path: '/edit_parents_profile',
        builder: (context, state) => EditParentsProfileView(),
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
      GoRoute(
        path: '/class_management',
        builder: (context, state) => ClassManagementView(),
      ),
      GoRoute(
        path: '/class_management_details',
        builder: (context, state) => ClassManagementDetails(),
      ),
      GoRoute(
        path: '/add_student',
        builder: (context, state) => AddStudentView(),
      ),
      GoRoute(
        path: '/courses',
        builder: (context, state) => CourseView(),
      ),
      GoRoute(
        path: '/courses_details/:id',
        builder: (context, state){
          final courseId = state.pathParameters['id']!;
          return CourseDetailsView(CourseId: courseId);
        },
      ),
      GoRoute(
        path: '/report',
        builder: (context, state) => ReportTableView(),
      ),
      GoRoute(
        path: '/report_details',
        builder: (context, state) => ReportDetailsView(),
      ),
      GoRoute(
        path: '/attendance',
        builder: (context, state) => AttendanceView(),
      ),
      //!-------------Admin -------------!
      GoRoute(
        path: '/classes',
        builder: (context, state) => ClassView(),
      ),
      GoRoute(
        path: '/admin_report_view',
        builder: (context, state) => ReportTableViews(),
      ),
      GoRoute(
        path: '/admin/report_detailsview',
        builder: (context, state) => ReportDetailView(),
      ),
      GoRoute(
        path: '/admin/quize_view',
        builder: (context, state) => QuizView(),
      ),
      GoRoute(
        path: '/admin/quize_details',
        builder: (context, state) => QuizDetails(),
      ),
      GoRoute(
        path: '/admin/all_courses',
        builder: (context, state) => AllCourses(),
      ),
      GoRoute(
        path: '/admin/lesson_view',
        builder: (context, state) => LessonView(lessonId: '',),
      ),
      GoRoute(
        path: '/admin/student_view',
        builder: (context, state) => Student_View(),
      ),
      GoRoute(
        path: '/admin/user_view',
        builder: (context, state) => UserView(),
      ),
      GoRoute(
        path: '/admin/user_view',
        builder: (context, state) => UserReport(),
      ),
    ],
  );
});


// Role-based screens mapping
final Map<UserRoleType, Map<BottomNavItem, Widget>> roleScreens = {
  UserRoleType.student: {
    BottomNavItem.home: StudentHomeView(),
    BottomNavItem.profile: StudentProfileView(),
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
    BottomNavItem.settings: SettingsView(),
  },
  UserRoleType.admin: {
    //BottomNavItem.home: AdminHomeScreen(),
    BottomNavItem.profile: AdminProfileView(),
    //BottomNavItem.settings: AdminSettingsScreen(),
  },
};