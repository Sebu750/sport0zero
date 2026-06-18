import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/models/user_model.dart';
import '../../features/matches/data/match_repository.dart';
import '../../features/matches/domain/models/match_model.dart';
import '../../features/matches/domain/models/tournament_model.dart';
import '../../features/standings/data/tournament_repository.dart';
import '../../features/standings/domain/standings_model.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/profile/data/profile_repository.dart';
import '../../features/profile/domain/achievement_model.dart';
import '../../features/profile/domain/tournament_history_model.dart';
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
// AUTH & PROFILE PROVIDERS
// ──────────────────────────────────────────────────────────────────────────────

/// Auth state notifier (Firebase Auth backed)
final authProvider = StateNotifierProvider<AuthRepository, AuthState>(
  (ref) {
    final repo = AuthRepository();
    // Auto-check session on provider creation
    repo.checkSession();
    return repo;
  },
);

/// Singleton ProfileRepository
final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(),
);

/// Real-time Firestore profile stream (null when not authenticated)
final profileStreamProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.user == null) {
    return Stream.value(null);
  }
  final repo = ref.watch(profileRepositoryProvider);
  return repo.profileStream(authState.user!.id);
});

/// Current authenticated user — prefers Firestore stream, falls back to auth state
final currentUserProvider = Provider<UserModel?>((ref) {
  final profileAsync = ref.watch(profileStreamProvider);
  final authState = ref.watch(authProvider);

  // Prefer live Firestore profile; fall back to auth state user
  return profileAsync.when(
    data: (profile) => profile ?? authState.user,
    loading: () => authState.user,
    error: (_, __) => authState.user,
  );
});

/// Primary role of the currently authenticated user (defaults to player).
/// Used for role-based routing, navigation filtering, and dashboard dispatch.
final currentRoleProvider = Provider<UserRole>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.roles.first ?? UserRole.player;
});

// ── FR-16: Achievements (Firestore stream + mock fallback) ────────────────────

final achievementsStreamProvider = StreamProvider<List<AchievementModel>>((ref) {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.user == null) {
    return Stream.value(<AchievementModel>[]);
  }
  return ref.watch(profileRepositoryProvider).achievementsStream(authState.user!.id);
});

/// Resolved achievements: Firestore data if available, else mock
final achievementsProvider = Provider<List<Achievement>>((ref) {
  final firestoreAch = ref.watch(achievementsStreamProvider);
  return firestoreAch.when(
    data: (list) {
      if (list.isNotEmpty) {
        return list.map((a) => Achievement(
          id: a.id, title: a.title, description: a.description,
          iconKey: a.iconKey, earnedAt: a.earnedAt,
        )).toList();
      }
      return mockAchievements; // mock fallback
    },
    loading: () => mockAchievements,
    error: (_, __) => mockAchievements,
  );
});

// ── FR-14: Tournament History (Firestore stream + mock fallback) ──────────────

final tournamentHistoryStreamProvider = StreamProvider<List<TournamentHistoryModel>>((ref) {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.user == null) {
    return Stream.value(<TournamentHistoryModel>[]);
  }
  return ref.watch(profileRepositoryProvider).tournamentHistoryStream(authState.user!.id);
});

// Mock tournament history fallback
final _mockTournamentHistory = [
  TournamentHistoryModel(
    id: 'th_001', tournamentId: 'torn_001', tournamentName: 'Corporate Cricket Challenge',
    teamName: 'Lahore Strikers', role: 'Captain', sportId: 'cricket',
    matchesPlayed: 6, runs: 245, wickets: 3, performanceRating: 8.5,
    startDate: DateTime(2025, 6, 1), endDate: DateTime(2025, 6, 20),
  ),
  TournamentHistoryModel(
    id: 'th_002', tournamentId: 'torn_002', tournamentName: 'Ramadan Night Cricket League',
    teamName: 'Lahore Strikers', role: 'All-rounder', sportId: 'cricket',
    matchesPlayed: 8, runs: 312, wickets: 7, performanceRating: 9.1,
    startDate: DateTime(2025, 3, 1), endDate: DateTime(2025, 3, 28),
  ),
  TournamentHistoryModel(
    id: 'th_003', tournamentId: 'torn_003', tournamentName: 'Inter-City T10 Blast',
    teamName: 'Karachi Kings', role: 'Batsman', sportId: 'cricket',
    matchesPlayed: 4, runs: 98, wickets: 0, performanceRating: 6.2,
    startDate: DateTime(2024, 12, 10), endDate: DateTime(2024, 12, 20),
  ),
];

final tournamentHistoryProvider = Provider<List<TournamentHistoryModel>>((ref) {
  final firestoreData = ref.watch(tournamentHistoryStreamProvider);
  return firestoreData.when(
    data: (list) => list.isNotEmpty ? list : _mockTournamentHistory,
    loading: () => _mockTournamentHistory,
    error: (_, __) => _mockTournamentHistory,
  );
});

// ── FR-13: Multi-sport stats (Firestore stream + mock fallback) ───────────────

final multiSportStatsStreamProvider = StreamProvider<Map<String, PlayerStatsModel>>((ref) {
  final authState = ref.watch(authProvider);
  if (!authState.isAuthenticated || authState.user == null) {
    return Stream.value(<String, PlayerStatsModel>{});
  }
  return ref.watch(profileRepositoryProvider).multiSportStatsStream(authState.user!.id);
});

/// Resolved multi-sport stats: Firestore if available, else cricket-only mock
final multiSportStatsProvider = Provider<Map<String, PlayerStatsModel>>((ref) {
  final firestoreStats = ref.watch(multiSportStatsStreamProvider);
  return firestoreStats.when(
    data: (map) => map.isNotEmpty ? map : {'cricket': mockPlayerStats},
    loading: () => {'cricket': mockPlayerStats},
    error: (_, __) => {'cricket': mockPlayerStats},
  );
});

/// Primary sport stats (convenience: first primary sport or cricket)
final primarySportStatsProvider = Provider<PlayerStatsModel>((ref) {
  final multiStats = ref.watch(multiSportStatsProvider);
  final user = ref.watch(currentUserProvider);
  final primarySport = (user?.primarySports.isNotEmpty ?? false)
      ? user!.primarySports.first
      : 'cricket';
  return multiStats[primarySport] ?? mockPlayerStats;
});

// ── FR-15: Recent Form (last 5 match performances) ────────────────────────────

/// Recent form: color-coded performance from last 5 completed matches.
/// Each entry: (matchTitle, date, rating 0-10, isWin)
final recentFormProvider = Provider<List<RecentFormEntry>>((ref) {
  final completedMatches = ref.watch(mockCompletedMatchesProvider);
  return completedMatches.take(5).map((m) {
    // Derive rating from mock data
    final isWin = m.winnerId == 'team_001';
    final rating = isWin ? 7.5 + (m.datetime.millisecond % 25) / 10 : 4.0 + (m.datetime.millisecond % 30) / 10;
    return RecentFormEntry(
      matchTitle: '${m.teamAName} vs ${m.teamBName}',
      date: m.datetime,
      rating: rating.clamp(0, 10),
      isWin: isWin,
      result: m.resultSummary ?? '',
    );
  }).toList();
});

/// Simple data class for recent form display
class RecentFormEntry {
  final String matchTitle;
  final DateTime date;
  final double rating;
  final bool isWin;
  final String result;

  const RecentFormEntry({
    required this.matchTitle,
    required this.date,
    required this.rating,
    required this.isWin,
    required this.result,
  });

  /// Color coding: green >= 7, amber >= 5, red < 5
  Color get formColor {
    if (rating >= 7) return const Color(0xFF2E7D32); // green
    if (rating >= 5) return const Color(0xFFF57C00); // amber
    return const Color(0xFFC62828); // red
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// DASHBOARD / MOCK DATA PROVIDERS
// ──────────────────────────────────────────────────────────────────────────────

/// Dashboard overview stats
final dashboardStatsProvider = Provider<DashboardStats>(
  (ref) => mockDashboardStats,
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

/// User achievements (now defined in AUTH & PROFILE section above)
// final achievementsProvider -- moved above

// ──────────────────────────────────────────────────────────────────────────────
// ROLE-SPECIFIC DASHBOARD PROVIDERS
// ──────────────────────────────────────────────────────────────────────────────

/// Manager dashboard stats
final managerStatsProvider = Provider<ManagerDashboardStats>(
  (ref) => mockManagerStats,
);

/// Player availability list (manager view)
final playerAvailabilityProvider = Provider<List<PlayerAvailability>>(
  (ref) => mockPlayerAvailability,
);

/// Team performance (manager view)
final teamPerformanceProvider = Provider<List<TeamPerformance>>(
  (ref) => mockTeamPerformance,
);

/// Organizer dashboard stats
final organizerStatsProvider = Provider<OrganizerDashboardStats>(
  (ref) => mockOrganizerStats,
);

/// Registration summary (organizer view)
final registrationSummaryProvider = Provider<List<RegistrationSummary>>(
  (ref) => mockRegistrationSummary,
);

/// Admin dashboard stats
final adminStatsProvider = Provider<AdminDashboardStats>(
  (ref) => mockAdminStats,
);

/// User growth data (admin view)
final userGrowthProvider = Provider<List<UserGrowthEntry>>(
  (ref) => mockUserGrowth,
);

/// Platform activity feed (admin view)
final platformActivityProvider = Provider<List<PlatformActivityItem>>(
  (ref) => mockPlatformActivity,
);
