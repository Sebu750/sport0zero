import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Feature screens
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/matches/presentation/matches_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/teams/presentation/teams_screen.dart';
import '../../features/teams/presentation/manage_team_screen.dart';
import '../../features/teams/presentation/manage_roster_screen.dart';
import '../../features/tournaments/presentation/tournaments_screen.dart';
import '../../features/tournaments/presentation/create_tournament_screen.dart';
import '../../features/tournaments/presentation/manage_registrations_screen.dart';
import '../../features/tournaments/presentation/manage_fixtures_screen.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/admin/presentation/admin_users_screen.dart';
import '../../features/admin/presentation/admin_analytics_screen.dart';
import '../../features/admin/presentation/admin_content_screen.dart';
import '../../features/auth/presentation/landing_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/role_login_screen.dart';
import '../../features/auth/presentation/demo_login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../shared/providers/app_providers.dart';
import '../../shared/models/user_model.dart';
import '../constants/role_routes.dart';
import '../widgets/navigation_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

/// ChangeNotifier that fires whenever auth state changes,
/// forcing GoRouter to re-evaluate redirects.
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    ref.listen<AuthState>(authProvider, (_, __) {
      notifyListeners();
    });
  }
}

/// Authenticated routes wrapped in the navigation shell.
/// Role guard in the router redirect function filters access per route.
final _shellRoutes = [
  // Shared routes
  GoRoute(
    path: '/dashboard',
    name: 'dashboard',
    pageBuilder: (context, state) => const NoTransitionPage(child: DashboardScreen()),
  ),
  GoRoute(
    path: '/profile',
    name: 'profile',
    pageBuilder: (context, state) => const NoTransitionPage(child: ProfileScreen()),
  ),
  GoRoute(
    path: '/edit-profile',
    name: 'edit-profile',
    pageBuilder: (context, state) => const NoTransitionPage(child: EditProfileScreen()),
  ),
  GoRoute(
    path: '/teams',
    name: 'teams',
    pageBuilder: (context, state) => const NoTransitionPage(child: TeamsScreen()),
  ),
  GoRoute(
    path: '/tournaments',
    name: 'tournaments',
    pageBuilder: (context, state) => const NoTransitionPage(child: TournamentsScreen()),
  ),
  GoRoute(
    path: '/matches',
    name: 'matches',
    pageBuilder: (context, state) => const NoTransitionPage(child: MatchesScreen()),
  ),
  GoRoute(
    path: '/analytics',
    name: 'analytics',
    pageBuilder: (context, state) => const NoTransitionPage(child: AnalyticsScreen()),
  ),
  GoRoute(
    path: '/settings',
    name: 'settings',
    pageBuilder: (context, state) => const NoTransitionPage(child: SettingsScreen()),
  ),
  // Manager-only routes
  GoRoute(
    path: '/manage-team',
    name: 'manage-team',
    pageBuilder: (context, state) => const NoTransitionPage(child: ManageTeamScreen()),
  ),
  GoRoute(
    path: '/manage-roster',
    name: 'manage-roster',
    pageBuilder: (context, state) => const NoTransitionPage(child: ManageRosterScreen()),
  ),
  // Organizer-only routes
  GoRoute(
    path: '/create-tournament',
    name: 'create-tournament',
    pageBuilder: (context, state) => const NoTransitionPage(child: CreateTournamentScreen()),
  ),
  GoRoute(
    path: '/manage-registrations',
    name: 'manage-registrations',
    pageBuilder: (context, state) => const NoTransitionPage(child: ManageRegistrationsScreen()),
  ),
  GoRoute(
    path: '/manage-fixtures',
    name: 'manage-fixtures',
    pageBuilder: (context, state) => const NoTransitionPage(child: ManageFixturesScreen()),
  ),
  // Admin-only routes
  GoRoute(
    path: '/admin-users',
    name: 'admin-users',
    pageBuilder: (context, state) => const NoTransitionPage(child: AdminUsersScreen()),
  ),
  GoRoute(
    path: '/admin-analytics',
    name: 'admin-analytics',
    pageBuilder: (context, state) => const NoTransitionPage(child: AdminAnalyticsScreen()),
  ),
  GoRoute(
    path: '/admin-content',
    name: 'admin-content',
    pageBuilder: (context, state) => const NoTransitionPage(child: AdminContentScreen()),
  ),
  // Legacy redirects
  GoRoute(
    path: '/home',
    redirect: (context, state) => '/dashboard',
  ),
  GoRoute(
    path: '/standings',
    redirect: (context, state) => '/tournaments',
  ),
];

/// Auth-guarded router provider.
/// Watches auth state and redirects unauthenticated users to /login,
/// logged-in users away from auth screens to /dashboard,
/// and enforces role-based route access.
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final userRole = ref.watch(currentRoleProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: _AuthRefreshNotifier(ref),
    routes: [
      // Public routes
      GoRoute(
        path: '/',
        name: 'landing',
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: '/player',
        name: 'player-login',
        builder: (context, state) => RoleLoginScreen(role: UserRole.player),
      ),
      GoRoute(
        path: '/manager',
        name: 'manager-login',
        builder: (context, state) => RoleLoginScreen(role: UserRole.manager),
      ),
      GoRoute(
        path: '/organizer',
        name: 'organizer-login',
        builder: (context, state) => RoleLoginScreen(role: UserRole.organizer),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin-login',
        builder: (context, state) => RoleLoginScreen(role: UserRole.admin),
      ),
      // Legacy auth routes
      GoRoute(
        path: '/login',
        redirect: (context, state) => '/',
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
        routes: _shellRoutes,
      ),
    ],
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final currentPath = state.matchedLocation;

      // Auth screens that logged-in users should be redirected away from
      final authRoutes = ['/', '/login', '/player', '/manager', '/organizer', '/admin', '/signup', '/forgot-password'];
      final isAuthRoute = authRoutes.contains(currentPath);

      // If not logged in and trying to access a protected route → /login
      if (!isLoggedIn && !isAuthRoute) {
        return '/';
      }

      // If logged in and trying to access an auth route → /dashboard
      if (isLoggedIn && isAuthRoute) {
        return '/dashboard';
      }

      // Role-based guard: if logged in and path is not allowed for their role → /dashboard
      if (isLoggedIn && !isAuthRoute && !RoleRoutes.isAllowed(userRole, currentPath)) {
        return '/dashboard';
      }

      return null;
    },
  );
});
