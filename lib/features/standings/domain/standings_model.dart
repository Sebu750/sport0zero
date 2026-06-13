/// Plain Dart model for league standings entry.
/// Not using freezed to avoid needing build_runner for this new model.
class StandingsEntry {
  final int position;
  final String teamId;
  final String teamName;
  final int played;
  final int won;
  final int lost;
  final int drawn;
  final int noResult;
  final int points;
  final double netRunRate;

  const StandingsEntry({
    required this.position,
    required this.teamId,
    required this.teamName,
    required this.played,
    required this.won,
    required this.lost,
    required this.drawn,
    required this.noResult,
    required this.points,
    required this.netRunRate,
  });

  factory StandingsEntry.fromJson(Map<String, dynamic> json) {
    return StandingsEntry(
      position: json['position'] as int,
      teamId: json['teamId'] as String,
      teamName: json['teamName'] as String,
      played: json['played'] as int,
      won: json['won'] as int,
      lost: json['lost'] as int,
      drawn: json['drawn'] as int,
      noResult: json['noResult'] as int,
      points: json['points'] as int,
      netRunRate: (json['netRunRate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'position': position,
    'teamId': teamId,
    'teamName': teamName,
    'played': played,
    'won': won,
    'lost': lost,
    'drawn': drawn,
    'noResult': noResult,
    'points': points,
    'netRunRate': netRunRate,
  };

  String get nrrDisplay => netRunRate >= 0
      ? '+${netRunRate.toStringAsFixed(3)}'
      : netRunRate.toStringAsFixed(3);
}

/// Wrapper for a tournament's standings table.
class TournamentStandings {
  final String tournamentId;
  final String tournamentName;
  final List<StandingsEntry> standings;

  const TournamentStandings({
    required this.tournamentId,
    required this.tournamentName,
    required this.standings,
  });

  factory TournamentStandings.fromJson(Map<String, dynamic> json) {
    return TournamentStandings(
      tournamentId: json['tournamentId'] as String,
      tournamentName: json['tournamentName'] as String,
      standings: (json['standings'] as List)
          .map((e) => StandingsEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
