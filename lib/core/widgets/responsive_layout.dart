import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Adaptive layout that switches between mobile, tablet, and desktop
/// based on screen width.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= AppTheme.desktopBreakpoint && desktop != null) {
      return desktop!;
    } else if (width >= AppTheme.tabletBreakpoint && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

/// Helper to check current breakpoint
class Breakpoint {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppTheme.tabletBreakpoint;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w >= AppTheme.tabletBreakpoint && w < AppTheme.desktopBreakpoint;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppTheme.desktopBreakpoint;
}
