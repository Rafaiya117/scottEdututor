import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scoctt_edututo/config/main.dart';
import 'package:scoctt_edututo/core/componets/bottom_navbar.dart';
import 'package:scoctt_edututo/features/auth/login/login_view.dart';
import 'package:scoctt_edututo/features/splash_screen.dart';
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
    ],
  );
});


final Map<BottomNavItem, String> bottomNavRoutes = {
  BottomNavItem.profile: '/profile',
  BottomNavItem.home: '/home',
  BottomNavItem.settings: '/settings',
};
