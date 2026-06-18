import '../../shared/models/user_model.dart';

/// Maps each UserRole to the set of route paths they are allowed to access.
/// Used by the router redirect guard and navigation shell filtering.
class RoleRoutes {
  RoleRoutes._();

  static const Map<UserRole, List<String>> allowedRoutes = {
    UserRole.player: [
      '/dashboard',
      '/profile',
      '/edit-profile',
      '/teams',
      '/tournaments',
      '/matches',
      '/analytics',
      '/settings',
    ],
    UserRole.manager: [
      '/dashboard',
      '/profile',
      '/teams',
      '/tournaments',
      '/matches',
      '/analytics',
      '/settings',
      '/manage-team',
      '/manage-roster',
    ],
    UserRole.organizer: [
      '/dashboard',
      '/profile',
      '/tournaments',
      '/matches',
      '/settings',
      '/create-tournament',
      '/manage-registrations',
      '/manage-fixtures',
    ],
    UserRole.admin: [
      '/dashboard',
      '/admin-users',
      '/admin-analytics',
      '/admin-content',
      '/settings',
    ],
  };

  /// Returns true if the given role is allowed to access the given path.
  static bool isAllowed(UserRole role, String path) {
    final routes = allowedRoutes[role] ?? [];
    return routes.contains(path);
  }

  /// Returns the allowed navigation item paths for a given role
  /// (subset of allowedRoutes excluding non-nav paths like /edit-profile).
  static List<String> navItems(UserRole role) {
    const navPaths = [
      '/dashboard',
      '/profile',
      '/teams',
      '/tournaments',
      '/matches',
      '/analytics',
      '/settings',
      '/manage-team',
      '/manage-roster',
      '/create-tournament',
      '/manage-registrations',
      '/manage-fixtures',
      '/admin-users',
      '/admin-analytics',
      '/admin-content',
    ];
    final allowed = allowedRoutes[role] ?? [];
    return navPaths.where(allowed.contains).toList();
  }
}
