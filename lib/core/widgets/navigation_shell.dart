import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../constants/role_routes.dart';
import '../../shared/models/user_model.dart';
import '../../shared/providers/app_providers.dart';

class NavigationShell extends ConsumerWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  // Master nav item registry — all possible items
  static const List<_NavItem> _allItems = [
    _NavItem('/dashboard', Icons.dashboard_outlined, Icons.dashboard, 'Dashboard', 'MAIN'),
    _NavItem('/profile', Icons.person_outline, Icons.person, 'Profile', 'MAIN'),
    _NavItem('/teams', Icons.groups_outlined, Icons.groups, 'Teams', 'SPORT'),
    _NavItem('/tournaments', Icons.emoji_events_outlined, Icons.emoji_events, 'Tournaments', 'SPORT'),
    _NavItem('/matches', Icons.sports_cricket_outlined, Icons.sports_cricket, 'Matches', 'SPORT'),
    _NavItem('/analytics', Icons.bar_chart_outlined, Icons.bar_chart, 'Analytics', 'ANALYTICS'),
    _NavItem('/settings', Icons.settings_outlined, Icons.settings, 'Settings', 'SYSTEM'),
    // Manager-only
    _NavItem('/manage-team', Icons.manage_accounts_outlined, Icons.manage_accounts, 'Manage Team', 'MANAGEMENT'),
    _NavItem('/manage-roster', Icons.assignment_outlined, Icons.assignment, 'Roster', 'MANAGEMENT'),
    // Organizer-only
    _NavItem('/create-tournament', Icons.add_circle_outline, Icons.add_circle, 'Create Tournament', 'ORGANIZER'),
    _NavItem('/manage-registrations', Icons.how_to_reg_outlined, Icons.how_to_reg, 'Registrations', 'ORGANIZER'),
    _NavItem('/manage-fixtures', Icons.calendar_month_outlined, Icons.calendar_month, 'Fixtures', 'ORGANIZER'),
    // Admin-only
    _NavItem('/admin-users', Icons.people_outline, Icons.people, 'Users', 'ADMINISTRATION'),
    _NavItem('/admin-analytics', Icons.insights_outlined, Icons.insights, 'Analytics', 'ADMINISTRATION'),
    _NavItem('/admin-content', Icons.flag_outlined, Icons.flag, 'Content', 'ADMINISTRATION'),
  ];

  static const int _mobileBottomCount = 5;

  /// Priority order for mobile bottom nav per role.
  static const Map<UserRole, List<String>> _mobilePriority = {
    UserRole.player:    ['/dashboard', '/matches', '/teams', '/profile', '/settings'],
    UserRole.manager:   ['/dashboard', '/teams', '/manage-roster', '/matches', '/settings'],
    UserRole.organizer: ['/dashboard', '/tournaments', '/manage-registrations', '/matches', '/settings'],
    UserRole.admin:     ['/dashboard', '/admin-users', '/admin-analytics', '/admin-content', '/settings'],
  };

  /// Returns nav items filtered to those allowed for the current role.
  List<_NavItem> _filteredItems(UserRole role) {
    final allowed = RoleRoutes.allowedRoutes[role] ?? [];
    return _allItems.where((item) => allowed.contains(item.path)).toList();
  }

  /// Returns mobile bottom nav items in priority order for the current role.
  List<_NavItem> _mobileItems(UserRole role) {
    final priority = _mobilePriority[role] ?? [];
    final filtered = _filteredItems(role);
    final ordered = <_NavItem>[];
    for (final path in priority) {
      final match = filtered.where((item) => item.path == path);
      if (match.isNotEmpty) ordered.add(match.first);
    }
    // Fill remaining if fewer than 5
    if (ordered.length < _mobileBottomCount) {
      for (final item in filtered) {
        if (!ordered.contains(item)) {
          ordered.add(item);
          if (ordered.length >= _mobileBottomCount) break;
        }
      }
    }
    return ordered.take(_mobileBottomCount).toList();
  }

  int _currentIndex(String location, List<_NavItem> items) {
    for (int i = 0; i < items.length; i++) {
      if (location.startsWith(items[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).matchedLocation;
    final role = ref.watch(currentRoleProvider);
    final user = ref.watch(currentUserProvider);
    final items = _filteredItems(role);
    final mobileItems = _mobileItems(role);
    final index = _currentIndex(location, items);
    final mobileIndex = _currentIndex(location, mobileItems);
    final width = MediaQuery.of(context).size.width;

    if (width >= 900) {
      return _buildDesktopShell(context, index, items, role, user?.displayName ?? 'User');
    }
    return _buildMobileShell(context, mobileIndex, mobileItems);
  }

  // ── Desktop / Tablet: Sidebar ────────────────────────────────────────────────
  Widget _buildDesktopShell(BuildContext context, int index, List<_NavItem> items, UserRole role, String userName) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter, end: Alignment.bottomCenter,
                  colors: [AppColors.primaryDark, AppColors.primary],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
                    child: Row(children: [
                      Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accentDark]),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: AppColors.accent.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))],
                        ),
                        child: const Icon(Icons.sports_cricket, color: Colors.white, size: 22),
                      ),
                      if (role == UserRole.admin) ...[  // Admin accent dot
                        const SizedBox(width: 2),
                        Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.red.shade400, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.red.shade400.withValues(alpha: 0.5), blurRadius: 4)])),
                        const SizedBox(width: 4),
                      ] else const SizedBox(width: 12),
                      const Text('Sport0Zero', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800, letterSpacing: -0.3)),
                    ]),
                  ),
                  Divider(color: Colors.white.withValues(alpha: 0.12), height: 1, indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _buildSidebarItems(items).length,
                      itemBuilder: (context, i) {
                        final entry = _buildSidebarItems(items)[i];
                        if (entry is _SectionLabel) {
                          final isAdmin = entry.label == 'ADMINISTRATION';
                          return Padding(
                            padding: EdgeInsets.fromLTRB(12, entry.firstInSection ? 16 : 8, 0, 6),
                            child: Text(entry.label, style: TextStyle(
                              color: isAdmin ? Colors.red.shade300.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.4),
                              fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                          );
                        }
                        final navItem = (entry as _NavEntry).item;
                        final navIndex = items.indexOf(navItem);
                        final isActive = index == navIndex;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => context.go(navItem.path),
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isActive ? Colors.white.withValues(alpha: 0.12) : Colors.transparent,
                                ),
                                child: Row(children: [
                                  Container(width: 3, height: isActive ? 24 : 0, decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(2))),
                                  const SizedBox(width: 10),
                                  Icon(isActive ? navItem.activeIcon : navItem.icon, color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6), size: 22),
                                  const SizedBox(width: 12),
                                  Text(navItem.label, style: TextStyle(color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6), fontSize: 14, fontWeight: isActive ? FontWeight.w600 : FontWeight.w400)),
                                ]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // User footer with role chip
                  Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(children: [
                      Container(
                        width: 36, height: 36,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.accent, width: 2)),
                        child: CircleAvatar(radius: 16, backgroundColor: Colors.white.withValues(alpha: 0.15), child: const Icon(Icons.person, color: Colors.white, size: 18)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 3),
                          _RoleChip(role: role),
                        ],
                      )),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          // Content area: max-width constrained for web
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Align(alignment: Alignment.topCenter, child: SizedBox(width: double.infinity, child: child)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Object> _buildSidebarItems(List<_NavItem> items) {
    final items_ = <Object>[];
    String? currentSection;
    for (final item in items) {
      if (item.section != currentSection) {
        currentSection = item.section;
        items_.add(_SectionLabel(currentSection, firstInSection: true));
      }
      items_.add(_NavEntry(item));
    }
    return items_;
  }

  // ── Mobile: Bottom nav ───────────────────────────────────────────────────────
  Widget _buildMobileShell(BuildContext context, int index, List<_NavItem> items) {
    final mobileItems = items.take(_mobileBottomCount).toList();
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.divider, width: 1)),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8, offset: const Offset(0, -2))],
        ),
        child: NavigationBar(
          elevation: 0,
          selectedIndex: index < mobileItems.length ? index : 0,
          onDestinationSelected: (i) {
            if (i < mobileItems.length) context.go(mobileItems[i].path);
          },
          destinations: mobileItems
              .map((item) => NavigationDestination(
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.activeIcon),
                    label: item.label,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

/// Inline role chip for the sidebar footer (dark background variant).
class _RoleChip extends StatelessWidget {
  final UserRole role;
  const _RoleChip({required this.role});

  @override
  Widget build(BuildContext context) {
    final (String label, Color color) = switch (role) {
      UserRole.player    => ('Player', AppColors.accent),
      UserRole.manager   => ('Manager', AppColors.accent),
      UserRole.organizer => ('Organizer', Colors.purple.shade300),
      UserRole.admin     => ('Admin', Colors.red.shade300),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}

class _NavItem {
  final String path;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String section;

  const _NavItem(this.path, this.icon, this.activeIcon, this.label, this.section);
}

class _SectionLabel {
  final String label;
  final bool firstInSection;
  const _SectionLabel(this.label, {this.firstInSection = false});
}

class _NavEntry {
  final _NavItem item;
  const _NavEntry(this.item);
}
