import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ManageFixturesScreen extends StatefulWidget {
  const ManageFixturesScreen({super.key});

  @override
  State<ManageFixturesScreen> createState() => _ManageFixturesScreenState();
}

class _ManageFixturesScreenState extends State<ManageFixturesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  bool _listView = true;

  final List<_Fixture> _fixtures = [
    _Fixture('Quarter-Final 1', 'Lahore Strikers', 'Karachi Kings', 'Mar 10, 2026', '7:00 PM', 'Gaddafi Stadium', 'Completed', '3-1'),
    _Fixture('Quarter-Final 2', 'Islamabad United', 'Peshawar Zalmi', 'Mar 11, 2026', '7:00 PM', 'Rawalpindi Stadium', 'Completed', '2-4'),
    _Fixture('Quarter-Final 3', 'Multan Sultans', 'Quetta Gladiators', 'Mar 12, 2026', '7:00 PM', 'Multan Cricket Stadium', 'Completed', '5-2'),
    _Fixture('Quarter-Final 4', 'Sialkot Stallions', 'Faisalabad Wolves', 'Mar 13, 2026', '7:00 PM', 'Sialkot Sports Complex', 'Completed', '1-0'),
    _Fixture('Semi-Final 1', 'Lahore Strikers', 'Peshawar Zalmi', 'Mar 18, 2026', '8:00 PM', 'Gaddafi Stadium', 'Upcoming', ''),
    _Fixture('Semi-Final 2', 'Multan Sultans', 'Sialkot Stallions', 'Mar 19, 2026', '8:00 PM', 'National Stadium', 'Upcoming', ''),
    _Fixture('Final', 'TBD', 'TBD', 'Mar 25, 2026', '9:00 PM', 'Gaddafi Stadium', 'Upcoming', ''),
    _Fixture('3rd Place Playoff', 'TBD', 'TBD', 'Mar 24, 2026', '7:00 PM', 'National Stadium', 'Upcoming', ''),
  ];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() { _tabCtrl.dispose(); super.dispose(); }

  String get _currentRound => ['Quarter-Final', 'Semi-Final', 'Final & Playoff'][_tabCtrl.index];

  List<_Fixture> get _filtered {
    return _fixtures.where((f) {
      if (_currentRound == 'Final & Playoff') return f.round.startsWith('Final') || f.round.startsWith('3rd');
      return f.round.startsWith(_currentRound);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final tp = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final ts = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;
    final purple = Colors.purple.shade600;
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width >= 900 ? 32 : 16, width >= 900 ? 32 : 16, width >= 900 ? 32 : 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(width: 48, height: 48,
                    decoration: BoxDecoration(color: purple.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                    child: Icon(Icons.calendar_month, color: purple, size: 26)),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Manage Fixtures', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                    Text('${_fixtures.length} fixtures across 3 rounds', style: TextStyle(fontSize: 13, color: ts)),
                  ])),
                  // View toggle
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(value: true, icon: Icon(Icons.view_list, size: 18)),
                      ButtonSegment(value: false, icon: Icon(Icons.grid_view, size: 18)),
                    ],
                    selected: {_listView},
                    onSelectionChanged: (s) => setState(() => _listView = s.first),
                    style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.icon(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fixtures regenerated'), backgroundColor: AppColors.success)),
                    icon: const Icon(Icons.auto_fix_high, size: 18),
                    label: const Text('Generate'),
                    style: FilledButton.styleFrom(backgroundColor: purple),
                  ),
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
          TabBar(
            controller: _tabCtrl,
            indicatorColor: purple,
            labelColor: purple,
            unselectedLabelColor: ts,
            tabs: const [
              Tab(text: 'Quarter-Finals'),
              Tab(text: 'Semi-Finals'),
              Tab(text: 'Final & Playoff'),
            ],
          ),
          Expanded(child: _listView
              ? ListView.builder(
                  padding: EdgeInsets.all(width >= 900 ? 32 : 16),
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => _buildFixtureCard(filtered[i], cardColor, tp, ts, purple, isDark),
                )
              : Padding(
                  padding: EdgeInsets.all(width >= 900 ? 32 : 16),
                  child: Wrap(
                    spacing: 16, runSpacing: 16,
                    children: filtered.map((f) => SizedBox(
                      width: width >= 900 ? 340 : double.infinity,
                      child: _buildFixtureCard(f, cardColor, tp, ts, purple, isDark),
                    )).toList(),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixtureCard(_Fixture f, Color cardColor, Color tp, Color ts, Color purple, bool isDark) {
    final isCompleted = f.status == 'Completed';
    final statusColor = isCompleted ? AppColors.success : AppColors.warning;

    return Card(
      color: cardColor,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              Text(f.round, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: purple)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(f.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: statusColor)),
              ),
            ]),
            const SizedBox(height: 14),
            Row(children: [
              Expanded(child: _teamBlock(f.teamA, tp, ts, isDark)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(color: purple.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(8)),
                child: Text(isCompleted ? f.score : 'VS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: purple)),
              ),
              Expanded(child: _teamBlock(f.teamB, tp, ts, isDark, right: true)),
            ]),
            const SizedBox(height: 12),
            Divider(color: isDark ? AppColors.dividerDark : AppColors.divider, height: 1),
            const SizedBox(height: 10),
            Row(children: [
              Icon(Icons.calendar_today, size: 14, color: ts),
              const SizedBox(width: 6),
              Text('${f.date} · ${f.time}', style: TextStyle(fontSize: 12, color: ts)),
              const Spacer(),
              Icon(Icons.place, size: 14, color: ts),
              const SizedBox(width: 6),
              Text(f.venue, style: TextStyle(fontSize: 12, color: ts)),
              if (!isCompleted) ...[
                const Spacer(),
                IconButton(icon: Icon(Icons.edit, size: 16, color: purple), onPressed: () {}, padding: EdgeInsets.zero, constraints: const BoxConstraints(minWidth: 28, minHeight: 28)),
              ],
            ]),
          ],
        ),
      ),
    );
  }

  Widget _teamBlock(String name, Color tp, Color ts, bool isDark, {bool right = false}) {
    return Column(
      crossAxisAlignment: right ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: name == 'TBD' ? ts : tp)),
        if (name != 'TBD') Text('Seed ${name.hashCode.abs() % 8 + 1}', style: TextStyle(fontSize: 10, color: ts)),
      ],
    );
  }
}

class _Fixture {
  final String round;
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String venue;
  final String status;
  final String score;
  _Fixture(this.round, this.teamA, this.teamB, this.date, this.time, this.venue, this.status, this.score);
}
