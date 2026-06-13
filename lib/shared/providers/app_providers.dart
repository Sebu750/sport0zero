import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/matches/data/match_repository.dart';
import '../../features/matches/domain/models/match_model.dart';
import '../../features/standings/data/tournament_repository.dart';
import '../../features/standings/domain/standings_model.dart';
import '../../features/auth/data/auth_repository.dart';

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
