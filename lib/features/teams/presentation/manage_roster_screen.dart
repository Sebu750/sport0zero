import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ManageRosterScreen extends StatefulWidget {
  const ManageRosterScreen({super.key});

  @override
  State<ManageRosterScreen> createState() => _ManageRosterScreenState();
}

class _ManageRosterScreenState extends State<ManageRosterScreen> {
  String _search = '';
  String _filterRole = 'All';

  final List<_Player> _players = [
    _Player('Haseeb Ahmed', 'Batsman', 'Active', 7, '+92 300 1111111'),
    _Player('Bilal Khan', 'Bowler', 'Active', 22, '+92 300 2222222'),
    _Player('Usman Tariq', 'All-rounder', 'Active', 10, '+92 300 3333333'),
    _Player('Fahad Raza', 'Batsman', 'Injured', 18, '+92 300 4444444'),
    _Player('Zain Malik', 'Wicket-keeper', 'Active', 3, '+92 300 5555555'),
    _Player('Hamza Ali', 'Bowler', 'Active', 14, '+92 300 6666666'),
    _Player('Saad Iqbal', 'All-rounder', 'Resting', 9, '+92 300 7777777'),
    _Player('Talha Mansoor', 'Batsman', 'Active', 45, '+92 300 8888888'),
    _Player('Waqas Javed', 'Bowler', 'Unavailable', 33, '+92 300 9999999'),
    _Player('Nabeel Ashraf', 'Batsman', 'Active', 11, '+92 300 0000001'),
    _Player('Arslan Butt', 'All-rounder', 'Active', 6, '+92 300 0000002'),
    _Player('Rizwan Haider', 'Bowler', 'Active', 17, '+92 300 0000003'),
  ];

  final _nameCtrl = TextEditingController();
  final _roleCtrl = TextEditingController(text: 'Batsman');
  final _phoneCtrl = TextEditingController();

  List<_Player> get _filtered {
    return _players.where((p) {
      final matchesSearch = p.name.toLowerCase().contains(_search.toLowerCase());
      final matchesRole = _filterRole == 'All' || p.role == _filterRole;
      return matchesSearch && matchesRole;
    }).toList();
  }

  int get _activeCount => _players.where((p) => p.status == 'Active').length;
  int get _injuredCount => _players.where((p) => p.status == 'Injured').length;
  int get _restingCount => _players.where((p) => p.status == 'Resting').length;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _roleCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final tp = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final ts = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.assignment_ind, color: AppColors.accent, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Manage Roster', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                  Text('${_players.length} players · $_activeCount active', style: TextStyle(fontSize: 13, color: ts)),
                ],
              )),
              FilledButton.icon(
                onPressed: () => _showAddPlayerDialog(context, isDark, tp, ts),
                icon: const Icon(Icons.person_add, size: 18),
                label: const Text('Add Player'),
                style: FilledButton.styleFrom(backgroundColor: AppColors.accent),
              ),
            ]),
            const SizedBox(height: 20),

            // Stats row
            Row(children: [
              _miniStat('Active', '$_activeCount', AppColors.success, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Injured', '$_injuredCount', AppColors.error, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Resting', '$_restingCount', AppColors.warning, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Total', '${_players.length}', AppColors.primary, cardColor, isDark),
            ]),
            const SizedBox(height: 20),

            // Search + filter
            Row(children: [
              Expanded(child: TextFormField(
                onChanged: (v) => setState(() => _search = v),
                decoration: InputDecoration(
                  hintText: 'Search players...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              )),
              const SizedBox(width: 12),
              ...['All', 'Batsman', 'Bowler', 'All-rounder', 'Wicket-keeper'].map((r) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FilterChip(
                  label: Text(r, style: TextStyle(fontSize: 11)),
                  selected: _filterRole == r,
                  onSelected: (_) => setState(() => _filterRole = r),
                  selectedColor: AppColors.accent.withValues(alpha: 0.15),
                  checkmarkColor: AppColors.accent,
                ),
              )),
            ]),
            const SizedBox(height: 16),

            // Roster table
            Card(
              color: cardColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStatePropertyAll(AppColors.accent.withValues(alpha: 0.06)),
                    headingTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: tp),
                    dataTextStyle: TextStyle(fontSize: 13, color: tp),
                    columns: const [
                      DataColumn(label: Text('Player')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Jersey'), numeric: true),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: filtered.map((p) {
                      final statusColor = switch (p.status) {
                        'Active' => AppColors.success,
                        'Injured' => AppColors.error,
                        'Resting' => AppColors.warning,
                        _ => ts,
                      };
                      return DataRow(cells: [
                        DataCell(Row(children: [
                          CircleAvatar(radius: 14, backgroundColor: AppColors.accent.withValues(alpha: 0.12),
                            child: Text(p.name[0], style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.accent))),
                          const SizedBox(width: 8),
                          Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        ])),
                        DataCell(Text(p.role)),
                        DataCell(Text('#${p.jersey}', style: const TextStyle(fontWeight: FontWeight.w700))),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                          child: Text(p.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: statusColor)),
                        )),
                        DataCell(Text(p.phone, style: TextStyle(fontSize: 12, color: ts))),
                        DataCell(Row(mainAxisSize: MainAxisSize.min, children: [
                          _statusMenu(p, ts),
                        ])),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusMenu(_Player p, Color ts) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, size: 18, color: ts),
      padding: EdgeInsets.zero,
      onSelected: (status) => setState(() => p.status = status),
      itemBuilder: (_) => [
        const PopupMenuItem(value: 'Active', child: Text('Active')),
        const PopupMenuItem(value: 'Injured', child: Text('Injured')),
        const PopupMenuItem(value: 'Resting', child: Text('Resting')),
        const PopupMenuItem(value: 'Unavailable', child: Text('Unavailable')),
      ],
    );
  }

  Widget _miniStat(String label, String value, Color color, Color cardColor, bool isDark) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color)),
            Text(label, style: TextStyle(fontSize: 10, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary)),
          ],
        )),
      ]),
    ));
  }

  void _showAddPlayerDialog(BuildContext context, bool isDark, Color tp, Color ts) {
    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: Text('Add Player', style: TextStyle(color: tp)),
      content: SizedBox(width: 360, child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(controller: _nameCtrl, decoration: InputDecoration(labelText: 'Full Name', prefixIcon: const Icon(Icons.person))),
        const SizedBox(height: 12),
        TextFormField(controller: _roleCtrl, decoration: InputDecoration(labelText: 'Role', prefixIcon: const Icon(Icons.sports_cricket))),
        const SizedBox(height: 12),
        TextFormField(controller: _phoneCtrl, decoration: InputDecoration(labelText: 'Phone', prefixIcon: const Icon(Icons.phone))),
      ])),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        FilledButton(
          onPressed: () {
            if (_nameCtrl.text.isNotEmpty) {
              setState(() {
                _players.add(_Player(_nameCtrl.text, _roleCtrl.text.isEmpty ? 'Batsman' : _roleCtrl.text, 'Active', _players.length + 1, _phoneCtrl.text));
                _nameCtrl.clear();
                _phoneCtrl.clear();
              });
              Navigator.pop(ctx);
            }
          },
          style: FilledButton.styleFrom(backgroundColor: AppColors.accent),
          child: const Text('Add'),
        ),
      ],
    ));
  }
}

class _Player {
  final String name;
  final String role;
  String status;
  final int jersey;
  final String phone;
  _Player(this.name, this.role, this.status, this.jersey, this.phone);
}
