import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/responsive_layout.dart';
import '../theme/app_colors.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;

  const NavigationShell({super.key, required this.child});

  static const List<_NavItem> _items = [
    _NavItem('/home', Icons.home_outlined, Icons.home, 'Home'),
    _NavItem('/matches', Icons.sports_soccer_outlined, Icons.sports_soccer, 'Matches'),
    _NavItem('/standings', Icons.leaderboard_outlined, Icons.leaderboard, 'Standings'),
    _NavItem('/profile', Icons.person_outline, Icons.person, 'Profile'),
  ];

  int _currentIndex(String location) {
    for (int i = 0; i < _items.length; i++) {
      if (location.startsWith(_items[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _currentIndex(location);

    return ResponsiveLayout(
      mobile: Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => context.go(_items[i].path),
          destinations: _items
              .map((item) => NavigationDestination(
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.activeIcon),
                    label: item.label,
                  ))
              .toList(),
        ),
      ),
      desktop: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: index,
              onDestinationSelected: (i) => context.go(_items[i].path),
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Icon(
                  Icons.sports_soccer,
                  size: 32,
                  color: AppColors.primary,
                ),
              ),
              destinations: _items
                  .map((item) => NavigationRailDestination(
                        icon: Icon(item.icon),
                        selectedIcon: Icon(item.activeIcon),
                        label: Text(item.label),
                      ))
                  .toList(),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: child),
          ],
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

  const _NavItem(this.path, this.icon, this.activeIcon, this.label);
}
