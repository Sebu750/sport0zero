import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/standings_model.dart';
import '../../matches/domain/models/tournament_model.dart';

/// Repository for tournament and standings data.
/// Currently serves from local mock JSON; swap in API calls when backend is ready.
class TournamentRepository {
  TournamentStandings? _standingsCache;
  List<TournamentModel>? _tournamentsCache;

  /// Fetch standings for the active tournament.
  Future<TournamentStandings> fetchStandings({String? tournamentId}) async {
    if (_standingsCache != null) return _standingsCache!;

    final raw = await rootBundle.loadString('assets/mock/standings.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    _standingsCache = TournamentStandings.fromJson(json);
    return _standingsCache!;
  }

  /// Fetch all tournaments.
  Future<List<TournamentModel>> fetchTournaments() async {
    if (_tournamentsCache != null) return _tournamentsCache!;

    final raw = await rootBundle.loadString('assets/mock/tournaments.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final list = (json['tournaments'] as List)
        .map((e) => TournamentModel.fromJson(e as Map<String, dynamic>))
        .toList();

    _tournamentsCache = list;
    return list;
  }

  /// Fetch only ongoing tournaments.
  Future<List<TournamentModel>> fetchActiveTournaments() async {
    final all = await fetchTournaments();
    return all
        .where((t) => t.status == TournamentStatus.ongoing)
        .toList();
  }

  void clearCache() {
    _standingsCache = null;
    _tournamentsCache = null;
  }
}
