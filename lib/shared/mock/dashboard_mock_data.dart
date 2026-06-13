import '../../features/matches/domain/models/match_model.dart';
import '../../features/matches/domain/models/tournament_model.dart';
import '../../shared/models/team_model.dart';
import '../../shared/models/player_stats_model.dart';
import '../../shared/models/user_model.dart';

// ── Mock Current User ──────────────────────────────────────────────────────────
final mockCurrentUser = UserModel(
  id: 'user_001',
  cnicHash: 'mock_hash_35202',
  phone: '+92 300 1234567',
  email: 'haseeb@sport0zero.com',
  displayName: 'Haseeb Ahmed',
  verified: true,
  roles: const [UserRole.player, UserRole.manager, UserRole.organizer],
  createdAt: DateTime(2025, 3, 15),
);

// ── Mock Teams ─────────────────────────────────────────────────────────────────
final mockTeams = [
  TeamModel(
    id: 'team_001',
    name: 'Lahore Strikers',
    shortName: 'LSK',
    sportId: 'cricket',
    managerId: 'user_001',
    homeGround: 'Gaddafi Stadium, Lahore',
    playerIds: const ['user_001', 'user_002', 'user_003', 'user_004', 'user_005',
                     'user_006', 'user_007', 'user_008', 'user_009', 'user_010', 'user_011'],
    foundedAt: DateTime(2024, 6, 1),
  ),
  TeamModel(
    id: 'team_002',
    name: 'Karachi Kings',
    shortName: 'KKG',
    sportId: 'cricket',
    managerId: 'user_020',
    homeGround: 'National Stadium, Karachi',
    playerIds: const ['user_012', 'user_013', 'user_001', 'user_014', 'user_015'],
    foundedAt: DateTime(2024, 1, 15),
  ),
  TeamModel(
    id: 'team_003',
    name: 'Islamabad United',
    shortName: 'ISU',
    sportId: 'cricket',
    managerId: 'user_030',
    homeGround: 'Pindi Cricket Stadium',
    playerIds: const ['user_016', 'user_017', 'user_018', 'user_019', 'user_001'],
    foundedAt: DateTime(2023, 11, 10),
  ),
];

// ── Mock Team Requests ─────────────────────────────────────────────────────────
class TeamRequest {
  final String id;
  final String teamName;
  final String playerName;
  final String playerId;
  final String type; // 'incoming' or 'outgoing'
  final String status; // 'pending', 'accepted', 'rejected'
  final DateTime date;

  const TeamRequest({
    required this.id,
    required this.teamName,
    required this.playerName,
    required this.playerId,
    required this.type,
    required this.status,
    required this.date,
  });
}

final mockTeamRequests = [
  TeamRequest(
    id: 'req_001',
    teamName: 'Lahore Strikers',
    playerName: 'Ali Raza',
    playerId: 'user_050',
    type: 'incoming',
    status: 'pending',
    date: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  TeamRequest(
    id: 'req_002',
    teamName: 'Lahore Strikers',
    playerName: 'Bilal Khan',
    playerId: 'user_051',
    type: 'incoming',
    status: 'pending',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  TeamRequest(
    id: 'req_003',
    teamName: 'Peshawar Zalmi',
    playerName: 'Haseeb Ahmed',
    playerId: 'user_001',
    type: 'outgoing',
    status: 'pending',
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
];

// ── Mock Matches ───────────────────────────────────────────────────────────────
final mockUpcomingMatches = [
  MatchModel(
    id: 'match_001',
    tournamentId: 'tourn_001',
    teamAId: 'team_001',
    teamBId: 'team_002',
    teamAName: 'Lahore Strikers',
    teamBName: 'Karachi Kings',
    datetime: DateTime.now().add(const Duration(days: 2, hours: 4)),
    status: MatchStatus.scheduled,
    venueId: 'venue_001',
  ),
  MatchModel(
    id: 'match_002',
    tournamentId: 'tourn_001',
    teamAId: 'team_001',
    teamBId: 'team_003',
    teamAName: 'Lahore Strikers',
    teamBName: 'Islamabad United',
    datetime: DateTime.now().add(const Duration(days: 5, hours: 2)),
    status: MatchStatus.scheduled,
  ),
  MatchModel(
    id: 'match_003',
    tournamentId: 'tourn_002',
    teamAId: 'team_002',
    teamBId: 'team_003',
    teamAName: 'Karachi Kings',
    teamBName: 'Islamabad United',
    datetime: DateTime.now().add(const Duration(days: 7)),
    status: MatchStatus.scheduled,
  ),
];

final mockLiveMatches = [
  MatchModel(
    id: 'match_live_001',
    tournamentId: 'tourn_001',
    teamAId: 'team_002',
    teamBId: 'team_003',
    teamAName: 'Karachi Kings',
    teamBName: 'Islamabad United',
    teamAScore: 145,
    teamBScore: 98,
    datetime: DateTime.now().subtract(const Duration(hours: 2)),
    status: MatchStatus.live,
    resultSummary: 'KK 145/4 (16.2 ov) vs ISU 98/3 (12.0 ov)',
  ),
];

final mockCompletedMatches = [
  MatchModel(
    id: 'match_c001',
    tournamentId: 'tourn_001',
    teamAId: 'team_001',
    teamBId: 'team_002',
    teamAName: 'Lahore Strikers',
    teamBName: 'Karachi Kings',
    teamAScore: 187,
    teamBScore: 162,
    datetime: DateTime.now().subtract(const Duration(days: 3)),
    status: MatchStatus.completed,
    winnerId: 'team_001',
    resultSummary: 'LSK won by 25 runs',
  ),
  MatchModel(
    id: 'match_c002',
    tournamentId: 'tourn_001',
    teamAId: 'team_003',
    teamBId: 'team_001',
    teamAName: 'Islamabad United',
    teamBName: 'Lahore Strikers',
    teamAScore: 156,
    teamBScore: 159,
    datetime: DateTime.now().subtract(const Duration(days: 7)),
    status: MatchStatus.completed,
    winnerId: 'team_001',
    resultSummary: 'LSK won by 6 wickets',
  ),
  MatchModel(
    id: 'match_c003',
    tournamentId: 'tourn_002',
    teamAId: 'team_001',
    teamBId: 'team_003',
    teamAName: 'Lahore Strikers',
    teamBName: 'Islamabad United',
    teamAScore: 134,
    teamBScore: 138,
    datetime: DateTime.now().subtract(const Duration(days: 14)),
    status: MatchStatus.completed,
    winnerId: 'team_003',
    resultSummary: 'ISU won by 4 wickets',
  ),
];

// ── Mock Tournaments ───────────────────────────────────────────────────────────
final mockTournaments = [
  TournamentModel(
    id: 'tourn_001',
    name: 'Premier T20 League 2026',
    sportId: 'cricket',
    organizerId: 'user_001',
    format: TournamentFormat.league,
    status: TournamentStatus.ongoing,
    description: 'Annual T20 league featuring top city teams',
    startDate: DateTime.now().subtract(const Duration(days: 10)),
    endDate: DateTime.now().add(const Duration(days: 20)),
    teamIds: const ['team_001', 'team_002', 'team_003'],
  ),
  TournamentModel(
    id: 'tourn_002',
    name: 'Ramadan Night Cricket Cup',
    sportId: 'cricket',
    organizerId: 'user_040',
    format: TournamentFormat.knockout,
    status: TournamentStatus.upcoming,
    description: 'Knockout tournament under floodlights',
    startDate: DateTime.now().add(const Duration(days: 14)),
    endDate: DateTime.now().add(const Duration(days: 21)),
    teamIds: const ['team_001', 'team_002', 'team_003'],
  ),
  TournamentModel(
    id: 'tourn_003',
    name: 'Corporate Cricket Challenge',
    sportId: 'cricket',
    organizerId: 'user_001',
    format: TournamentFormat.roundRobin,
    status: TournamentStatus.completed,
    description: 'Inter-company cricket tournament',
    startDate: DateTime.now().subtract(const Duration(days: 60)),
    endDate: DateTime.now().subtract(const Duration(days: 30)),
    teamIds: const ['team_001', 'team_002'],
  ),
];

// ── Mock Player Stats ──────────────────────────────────────────────────────────
final mockPlayerStats = PlayerStatsModel(
  userId: 'user_001',
  sportId: 'cricket',
  format: MatchFormat.t20,
  matches: 42,
  innings: 38,
  runs: 1284,
  balls: 967,
  highScore: 89,
  average: 38.9,
  strikeRate: 132.8,
  fifties: 8,
  hundreds: 1,
  fours: 118,
  sixes: 47,
  notOuts: 5,
  ballsBowled: 360,
  runsConceded: 486,
  wickets: 18,
  economy: 8.1,
  bowlingAverage: 27.0,
  bowlingStrikeRate: 20.0,
  maidens: 2,
  bestBowlingWickets: 3,
  bestBowlingRuns: 22,
  catches: 14,
  stumpings: 0,
  runOuts: 5,
);

// ── Mock Notifications ─────────────────────────────────────────────────────────
class NotificationItem {
  final String id;
  final String title;
  final String message;
  final DateTime time;
  final bool read;
  final String type; // 'match', 'team', 'tournament', 'system'

  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    this.read = false,
    required this.type,
  });
}

final mockNotifications = [
  NotificationItem(
    id: 'notif_001',
    title: 'Match Reminder',
    message: 'Lahore Strikers vs Karachi Kings in 2 days',
    time: DateTime.now().subtract(const Duration(minutes: 30)),
    type: 'match',
  ),
  NotificationItem(
    id: 'notif_002',
    title: 'Join Request',
    message: 'Ali Raza wants to join Lahore Strikers',
    time: DateTime.now().subtract(const Duration(hours: 3)),
    type: 'team',
  ),
  NotificationItem(
    id: 'notif_003',
    title: 'Tournament Update',
    message: 'Premier T20 League fixtures updated',
    time: DateTime.now().subtract(const Duration(hours: 8)),
    type: 'tournament',
  ),
  NotificationItem(
    id: 'notif_004',
    title: 'Match Result',
    message: 'Lahore Strikers won by 25 runs vs Karachi Kings',
    time: DateTime.now().subtract(const Duration(days: 3)),
    read: true,
    type: 'match',
  ),
  NotificationItem(
    id: 'notif_005',
    title: 'Welcome to Sport0Zero!',
    message: 'Complete your profile to get started',
    time: DateTime.now().subtract(const Duration(days: 7)),
    read: true,
    type: 'system',
  ),
];

// ── Mock Recent Activity ───────────────────────────────────────────────────────
class ActivityItem {
  final String id;
  final String title;
  final String subtitle;
  final DateTime time;
  final String icon; // icon key for switch

  const ActivityItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });
}

final mockRecentActivity = [
  ActivityItem(
    id: 'act_001',
    title: 'Joined Team',
    subtitle: 'Islamabad United',
    time: DateTime.now().subtract(const Duration(days: 1)),
    icon: 'groups',
  ),
  ActivityItem(
    id: 'act_002',
    title: 'Match Won',
    subtitle: 'LSK vs KKG — won by 25 runs',
    time: DateTime.now().subtract(const Duration(days: 3)),
    icon: 'emoji_events',
  ),
  ActivityItem(
    id: 'act_003',
    title: 'Registered Tournament',
    subtitle: 'Ramadan Night Cricket Cup',
    time: DateTime.now().subtract(const Duration(days: 5)),
    icon: 'event',
  ),
  ActivityItem(
    id: 'act_004',
    title: 'Scored 89*',
    subtitle: 'vs Islamabad United — Personal Best',
    time: DateTime.now().subtract(const Duration(days: 7)),
    icon: 'star',
  ),
  ActivityItem(
    id: 'act_005',
    title: 'Team Created',
    subtitle: 'Lahore Strikers',
    time: DateTime.now().subtract(const Duration(days: 14)),
    icon: 'add_circle',
  ),
];

// ── Dashboard Stats ────────────────────────────────────────────────────────────
class DashboardStats {
  final int teamCount;
  final int upcomingMatchCount;
  final int activeTournamentCount;
  final double playerRating;

  const DashboardStats({
    required this.teamCount,
    required this.upcomingMatchCount,
    required this.activeTournamentCount,
    required this.playerRating,
  });
}

const mockDashboardStats = DashboardStats(
  teamCount: 3,
  upcomingMatchCount: 3,
  activeTournamentCount: 2,
  playerRating: 7.8,
);

// ── Mock Tournament Registration Requests ──────────────────────────────────────
class TournamentRegistration {
  final String id;
  final String teamName;
  final String captainName;
  final String status; // 'pending', 'approved', 'rejected'
  final DateTime date;

  const TournamentRegistration({
    required this.id,
    required this.teamName,
    required this.captainName,
    required this.status,
    required this.date,
  });
}

final mockTournamentRegistrations = [
  TournamentRegistration(
    id: 'treg_001',
    teamName: 'Multan Sultans',
    captainName: 'Sohail Akhtar',
    status: 'pending',
    date: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  TournamentRegistration(
    id: 'treg_002',
    teamName: 'Quetta Gladiators',
    captainName: 'Imran Butt',
    status: 'pending',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  TournamentRegistration(
    id: 'treg_003',
    teamName: 'Faisalabad Wolves',
    captainName: 'Usman Ghani',
    status: 'approved',
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
];

// ── Analytics Trend Data ───────────────────────────────────────────────────────
class TrendPoint {
  final String label;
  final double value;

  const TrendPoint({required this.label, required this.value});
}

final mockBattingTrend = [
  TrendPoint(label: 'Jan', value: 32),
  TrendPoint(label: 'Feb', value: 45),
  TrendPoint(label: 'Mar', value: 28),
  TrendPoint(label: 'Apr', value: 67),
  TrendPoint(label: 'May', value: 54),
  TrendPoint(label: 'Jun', value: 89),
];

final mockBowlingTrend = [
  TrendPoint(label: 'Jan', value: 9.2),
  TrendPoint(label: 'Feb', value: 7.8),
  TrendPoint(label: 'Mar', value: 8.5),
  TrendPoint(label: 'Apr', value: 6.9),
  TrendPoint(label: 'May', value: 8.1),
  TrendPoint(label: 'Jun', value: 7.3),
];

// ── Mock Achievements ──────────────────────────────────────────────────────────
class Achievement {
  final String id;
  final String title;
  final String description;
  final String iconKey;
  final DateTime earnedAt;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.iconKey,
    required this.earnedAt,
  });
}

final mockAchievements = [
  Achievement(
    id: 'ach_001',
    title: 'Debut Century',
    description: 'Scored 100+ in a competitive match',
    iconKey: 'star',
    earnedAt: DateTime(2025, 8, 12),
  ),
  Achievement(
    id: 'ach_002',
    title: 'Tournament Winner',
    description: 'Won the Corporate Cricket Challenge',
    iconKey: 'emoji_events',
    earnedAt: DateTime(2025, 6, 20),
  ),
  Achievement(
    id: 'ach_003',
    title: 'Hat-trick Hero',
    description: 'Took 3 wickets in 3 consecutive balls',
    iconKey: 'whatshot',
    earnedAt: DateTime(2025, 4, 5),
  ),
  Achievement(
    id: 'ach_004',
    title: 'Team Captain',
    description: 'Led Lahore Strikers to victory',
    iconKey: 'shield',
    earnedAt: DateTime(2025, 1, 15),
  ),
];
