import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.divider, width: 1),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.primary.withValues(alpha: 0.1),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.surface,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      indicatorColor: AppColors.primary.withValues(alpha: 0.1),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: AppColors.textPrimaryDark,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.dividerDark, width: 1),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.surfaceDark,
      indicatorColor: AppColors.primary.withValues(alpha: 0.15),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryLight),
      indicatorColor: AppColors.primary.withValues(alpha: 0.15),
    ),
  );
}
