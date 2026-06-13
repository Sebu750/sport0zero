import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Feature screens
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/matches/presentation/matches_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/teams/presentation/teams_screen.dart';
import '../../features/tournaments/presentation/tournaments_screen.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../widgets/navigation_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  debugLogDiagnostics: true,
  routes: [
    // Auth routes (no shell)
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    // Main app shell with sidebar nav
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavigationShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
        ),
        GoRoute(
          path: '/teams',
          name: 'teams',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TeamsScreen(),
          ),
        ),
        GoRoute(
          path: '/tournaments',
          name: 'tournaments',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TournamentsScreen(),
          ),
        ),
        GoRoute(
          path: '/matches',
          name: 'matches',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MatchesScreen(),
          ),
        ),
        GoRoute(
          path: '/analytics',
          name: 'analytics',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AnalyticsScreen(),
          ),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
        // Legacy redirect
        GoRoute(
          path: '/home',
          redirect: (context, state) => '/dashboard',
        ),
        GoRoute(
          path: '/standings',
          redirect: (context, state) => '/tournaments',
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    // Auth guard placeholder
    return null;
  },
);
