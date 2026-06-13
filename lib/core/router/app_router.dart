import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Feature screens
import '../../features/home/presentation/home_screen.dart';
import '../../features/matches/presentation/matches_screen.dart';
import '../../features/standings/presentation/standings_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../widgets/navigation_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
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

    // Main app shell with bottom nav / side rail
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavigationShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
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
          path: '/standings',
          name: 'standings',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: StandingsScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ProfileScreen(),
          ),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    // Auth guard placeholder — enable when backend is connected
    // final container = ProviderScope.containerOf(context);
    // final authState = container.read(authProvider);
    // final isLoggedIn = authState.isAuthenticated;
    // final isAuthRoute = state.matchedLocation == '/login' ||
    //     state.matchedLocation == '/signup' ||
    //     state.matchedLocation == '/forgot-password';
    // if (!isLoggedIn && !isAuthRoute) return '/login';
    // if (isLoggedIn && isAuthRoute) return '/home';
    return null;
  },
);
