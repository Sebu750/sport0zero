import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../../shared/providers/app_providers.dart';

class NavigationShell extends ConsumerWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  static const List<_NavItem> _items = [
    _NavItem('/dashboard', Icons.dashboard_outlined, Icons.dashboard, 'Dashboard', 'MAIN'),
    _NavItem('/profile', Icons.person_outline, Icons.person, 'Profile', 'MAIN'),
    _NavItem('/teams', Icons.groups_outlined, Icons.groups, 'Teams', 'SPORT'),
    _NavItem('/tournaments', Icons.emoji_events_outlined, Icons.emoji_events, 'Tournaments', 'SPORT'),
    _NavItem('/matches', Icons.sports_cricket_outlined, Icons.sports_cricket, 'Matches', 'SPORT'),
    _NavItem('/analytics', Icons.bar_chart_outlined, Icons.bar_chart, 'Analytics', 'SYSTEM'),
    _NavItem('/settings', Icons.settings_outlined, Icons.settings, 'Settings', 'SYSTEM'),
  ];

  static const int _mobileBottomCount = 5;

  int _currentIndex(String location) {
    for (int i = 0; i < _items.length; i++) {
      if (location.startsWith(_items[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _currentIndex(location);
    final width = MediaQuery.of(context).size.width;
    final user = ref.watch(currentUserProvider);

    if (width >= 900) {
      return _buildDesktopShell(context, index, user.displayName ?? 'Player');
    }
    return _buildMobileShell(context, index);
  }

  // ── Desktop / Tablet: Sidebar ────────────────────────────────────────────────
  Widget _buildDesktopShell(BuildContext context, int index, String userName) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryDark, AppColors.primary],
                ),
              ),
              child: Column(
                children: [
                  // Logo
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40, height: 40,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.accent, AppColors.accentDark],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.3),
                                blurRadius: 8, offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.sports_cricket, color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Sport0Zero',
                          style: TextStyle(
                            color: Colors.white, fontSize: 19, fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.white.withValues(alpha: 0.12), height: 1, indent: 16, endIndent: 16),
                  const SizedBox(height: 8),
                  // Nav items with section labels
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: _buildSidebarItems().length,
                      itemBuilder: (context, i) {
                        final entry = _buildSidebarItems()[i];
                        if (entry is _SectionLabel) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(12, entry.firstInSection ? 16 : 8, 0, 6),
                            child: Text(
                              entry.label,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.4),
                                fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1.2,
                              ),
                            ),
                          );
                        }
                        final navItem = (entry as _NavEntry).item;
                        final navIndex = _items.indexOf(navItem);
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
                                child: Row(
                                  children: [
                                    // Orange active indicator
                                    Container(
                                      width: 3,
                                      height: isActive ? 24 : 0,
                                      decoration: BoxDecoration(
                                        color: AppColors.accent,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      isActive ? navItem.activeIcon : navItem.icon,
                                      color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      navItem.label,
                                      style: TextStyle(
                                        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.6),
                                        fontSize: 14,
                                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // User avatar at bottom
                  Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.accent, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white.withValues(alpha: 0.15),
                            child: const Icon(Icons.person, color: Colors.white, size: 18),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userName, style: const TextStyle(
                                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600,
                              ), maxLines: 1, overflow: TextOverflow.ellipsis),
                              Text('Pro Player', style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5), fontSize: 11,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  List<Object> _buildSidebarItems() {
    final items = <Object>[];
    String? currentSection;
    for (final item in _items) {
      if (item.section != currentSection) {
        currentSection = item.section;
        items.add(_SectionLabel(currentSection, firstInSection: true));
      }
      items.add(_NavEntry(item));
    }
    return items;
  }

  // ── Mobile: Bottom nav ───────────────────────────────────────────────────────
  Widget _buildMobileShell(BuildContext context, int index) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.divider, width: 1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8, offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          elevation: 0,
          selectedIndex: index < _mobileBottomCount ? index : 0,
          onDestinationSelected: (i) => context.go(_items[i].path),
          destinations: _items.take(_mobileBottomCount)
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
