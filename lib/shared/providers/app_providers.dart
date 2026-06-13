import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/matches/data/match_repository.dart';
import '../../features/matches/domain/models/match_model.dart';
import '../../features/matches/domain/models/tournament_model.dart';
import '../../features/standings/data/tournament_repository.dart';
import '../../features/standings/domain/standings_model.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../shared/models/team_model.dart';
import '../../shared/models/player_stats_model.dart';
import '../mock/dashboard_mock_data.dart';

// SharedPreferences provider (override in main() with real instance)
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferences not initialized. Override in ProviderScope.',
  );
});

// Theme mode provider
enum AppThemeMode { system, light, dark }

class ThemeNotifier extends StateNotifier<AppThemeMode> {
  ThemeNotifier() : super(AppThemeMode.system);

  ThemeMode get themeMode {
    switch (state) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  void setTheme(AppThemeMode mode) => state = mode;
}

final themeProvider = StateNotifierProvider<ThemeNotifier, AppThemeMode>(
  (ref) => ThemeNotifier(),
);

// Connectivity provider (placeholder)
final isConnectedProvider = StateProvider<bool>((ref) => true);

// ──────────────────────────────────────────────────────────────────────────────
// DATA PROVIDERS
// ──────────────────────────────────────────────────────────────────────────────

/// Singleton match repository
final matchRepositoryProvider = Provider<MatchRepository>(
  (ref) => MatchRepository(),
);

/// Singleton tournament repository
final tournamentRepositoryProvider = Provider<TournamentRepository>(
  (ref) => TournamentRepository(),
);

/// All matches (live + scheduled + completed)
final matchesProvider = FutureProvider<List<MatchModel>>((ref) async {
  final repo = ref.watch(matchRepositoryProvider);
  return repo.fetchMatches();
});

/// Only live matches
final liveMatchesProvider = FutureProvider<List<MatchModel>>((ref) async {
  final repo = ref.watch(matchRepositoryProvider);
  return repo.fetchLiveMatches();
});

/// Today's matches
final todayMatchesProvider = FutureProvider<List<MatchModel>>((ref) async {
  final repo = ref.watch(matchRepositoryProvider);
  return repo.fetchTodayMatches();
});

/// Upcoming (scheduled) matches, sorted by datetime
final upcomingMatchesProvider = FutureProvider<List<MatchModel>>((ref) async {
  final repo = ref.watch(matchRepositoryProvider);
  return repo.fetchUpcomingMatches();
});

/// Completed matches (results), most recent first
final completedMatchesProvider = FutureProvider<List<MatchModel>>((ref) async {
  final repo = ref.watch(matchRepositoryProvider);
  return repo.fetchCompletedMatches();
});

/// Tournament standings
final standingsProvider = FutureProvider<TournamentStandings>((ref) async {
  final repo = ref.watch(tournamentRepositoryProvider);
  return repo.fetchStandings();
});

/// Active (ongoing) tournaments
final activeTournamentsProvider = FutureProvider<List<dynamic>>((ref) async {
  final repo = ref.watch(tournamentRepositoryProvider);
  return repo.fetchActiveTournaments();
});

// ──────────────────────────────────────────────────────────────────────────────
// AUTH PROVIDER
// ──────────────────────────────────────────────────────────────────────────────

final authProvider = StateNotifierProvider<AuthRepository, AuthState>(
  (ref) => AuthRepository(),
);

// ──────────────────────────────────────────────────────────────────────────────
// DASHBOARD / MOCK DATA PROVIDERS
// ──────────────────────────────────────────────────────────────────────────────

/// Dashboard overview stats
final dashboardStatsProvider = Provider<DashboardStats>(
  (ref) => mockDashboardStats,
);

/// Current user profile (mock)
final currentUserProvider = Provider(
  (ref) => mockCurrentUser,
);

/// My teams list
final myTeamsProvider = Provider<List<TeamModel>>(
  (ref) => mockTeams,
);

/// Team join requests
final teamRequestsProvider = Provider<List<TeamRequest>>(
  (ref) => mockTeamRequests,
);

/// My tournaments list
final myTournamentsProvider = Provider<List<TournamentModel>>(
  (ref) => mockTournaments,
);

/// Mock upcoming matches for dashboard
final mockUpcomingMatchesProvider = Provider<List<MatchModel>>(
  (ref) => mockUpcomingMatches,
);

/// Mock live matches for dashboard
final mockLiveMatchesProvider = Provider<List<MatchModel>>(
  (ref) => mockLiveMatches,
);

/// Mock completed matches for dashboard
final mockCompletedMatchesProvider = Provider<List<MatchModel>>(
  (ref) => mockCompletedMatches,
);

/// Notifications list
final notificationsProvider = Provider<List<NotificationItem>>(
  (ref) => mockNotifications,
);

/// Recent activity list
final recentActivityProvider = Provider<List<ActivityItem>>(
  (ref) => mockRecentActivity,
);

/// Player stats (current user)
final playerStatsProvider = Provider<PlayerStatsModel>(
  (ref) => mockPlayerStats,
);

/// Tournament registrations (for organizer view)
final tournamentRegistrationsProvider = Provider<List<TournamentRegistration>>(
  (ref) => mockTournamentRegistrations,
);

/// Batting performance trend
final battingTrendProvider = Provider<List<TrendPoint>>(
  (ref) => mockBattingTrend,
);

/// Bowling performance trend
final bowlingTrendProvider = Provider<List<TrendPoint>>(
  (ref) => mockBowlingTrend,
);

/// User achievements
final achievementsProvider = Provider<List<Achievement>>(
  (ref) => mockAchievements,
);
