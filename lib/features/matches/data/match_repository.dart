import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/models/match_model.dart';

/// Repository for match data.
/// Currently serves from local mock JSON; swap in API calls when backend is ready.
class MatchRepository {
  List<MatchModel>? _cache;

  /// Fetch all matches (live + scheduled + completed).
  Future<List<MatchModel>> fetchMatches() async {
    if (_cache != null) return _cache!;

    final raw = await rootBundle.loadString('assets/mock/matches.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final list = (json['matches'] as List)
        .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
        .toList();

    _cache = list;
    return list;
  }

  /// Fetch only live matches.
  Future<List<MatchModel>> fetchLiveMatches() async {
    final all = await fetchMatches();
    return all.where((m) => m.status == MatchStatus.live).toList();
  }

  /// Fetch today's matches (scheduled + live).
  Future<List<MatchModel>> fetchTodayMatches() async {
    final all = await fetchMatches();
    final now = DateTime.now();
    return all.where((m) {
      final sameDay = m.datetime.year == now.year &&
          m.datetime.month == now.month &&
          m.datetime.day == now.day;
      return sameDay &&
          (m.status == MatchStatus.scheduled || m.status == MatchStatus.live);
    }).toList();
  }

  /// Fetch upcoming (scheduled) matches.
  Future<List<MatchModel>> fetchUpcomingMatches() async {
    final all = await fetchMatches();
    return all
        .where((m) => m.status == MatchStatus.scheduled)
        .toList()
      ..sort((a, b) => a.datetime.compareTo(b.datetime));
  }

  /// Fetch completed matches (results).
  Future<List<MatchModel>> fetchCompletedMatches() async {
    final all = await fetchMatches();
    return all
        .where((m) => m.status == MatchStatus.completed)
        .toList()
      ..sort((a, b) => b.datetime.compareTo(a.datetime));
  }

  /// Fetch a single match by ID.
  Future<MatchModel?> fetchMatch(String id) async {
    final all = await fetchMatches();
    try {
      return all.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Clear cache (e.g. on pull-to-refresh).
  void clearCache() => _cache = null;
}
