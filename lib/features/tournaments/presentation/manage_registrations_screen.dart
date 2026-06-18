import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ManageRegistrationsScreen extends StatefulWidget {
  const ManageRegistrationsScreen({super.key});

  @override
  State<ManageRegistrationsScreen> createState() => _ManageRegistrationsScreenState();
}

class _ManageRegistrationsScreenState extends State<ManageRegistrationsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  final Set<int> _selected = {};

  final List<_Registration> _registrations = [
    _Registration('Lahore Strikers', 'Haseeb Ahmed', 'Mar 1, 2026', 'Approved'),
    _Registration('Karachi Kings', 'Ahmed Raza', 'Mar 2, 2026', 'Approved'),
    _Registration('Islamabad United', 'Sara Khan', 'Mar 3, 2026', 'Pending'),
    _Registration('Peshawar Zalmi', 'Bilal Khan', 'Mar 3, 2026', 'Pending'),
    _Registration('Quetta Gladiators', 'Zain Malik', 'Mar 4, 2026', 'Pending'),
    _Registration('Multan Sultans', 'Usman Tariq', 'Mar 5, 2026', 'Approved'),
    _Registration('Rawalpindi Hawks', 'Fahad Raza', 'Mar 5, 2026', 'Rejected'),
    _Registration('Faisalabad Wolves', 'Hamza Ali', 'Mar 6, 2026', 'Pending'),
    _Registration('Sialkot Stallions', 'Saad Iqbal', 'Mar 6, 2026', 'Approved'),
    _Registration('Gujranwala Lions', 'Talha Mansoor', 'Mar 7, 2026', 'Pending'),
  ];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 4, vsync: this);
    _tabCtrl.addListener(() => setState(() => _selected.clear()));
  }

  @override
  void dispose() { _tabCtrl.dispose(); super.dispose(); }

  String get _currentFilter => ['All', 'Pending', 'Approved', 'Rejected'][_tabCtrl.index];

  List<_Registration> get _filtered {
    if (_currentFilter == 'All') return _registrations;
    return _registrations.where((r) => r.status == _currentFilter).toList();
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

    final total = _registrations.length;
    final approved = _registrations.where((r) => r.status == 'Approved').length;
    final pending = _registrations.where((r) => r.status == 'Pending').length;
    final rejected = _registrations.where((r) => r.status == 'Rejected').length;

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
                    child: Icon(Icons.how_to_reg, color: purple, size: 26)),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Manage Registrations', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                    Text('Ramadan Night Cricket League 2026', style: TextStyle(fontSize: 13, color: ts)),
                  ])),
                  if (_selected.isNotEmpty) ...[
                    OutlinedButton.icon(
                      onPressed: () => _bulkAction('Approved'),
                      icon: const Icon(Icons.check, size: 16, color: AppColors.success),
                      label: Text('Approve (${_selected.length})'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () => _bulkAction('Rejected'),
                      icon: const Icon(Icons.close, size: 16, color: AppColors.error),
                      label: Text('Reject (${_selected.length})'),
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.error, side: const BorderSide(color: AppColors.error)),
                    ),
                  ],
                ]),
                const SizedBox(height: 16),
                // Stats
                Row(children: [
                  _miniStat('Total', '$total', AppColors.primary, cardColor, isDark),
                  const SizedBox(width: 10),
                  _miniStat('Approved', '$approved', AppColors.success, cardColor, isDark),
                  const SizedBox(width: 10),
                  _miniStat('Pending', '$pending', AppColors.warning, cardColor, isDark),
                  const SizedBox(width: 10),
                  _miniStat('Rejected', '$rejected', AppColors.error, cardColor, isDark),
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Tabs
          TabBar(
            controller: _tabCtrl,
            isScrollable: true,
            indicatorColor: purple,
            labelColor: purple,
            unselectedLabelColor: ts,
            tabs: [
              Tab(text: 'All ($total)'),
              Tab(text: 'Pending ($pending)'),
              Tab(text: 'Approved ($approved)'),
              Tab(text: 'Rejected ($rejected)'),
            ],
          ),
          // Table
          Expanded(child: SingleChildScrollView(
            padding: EdgeInsets.all(width >= 900 ? 32 : 16),
            child: Card(
              color: cardColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: DataTable(
                  headingRowColor: WidgetStatePropertyAll(purple.withValues(alpha: 0.06)),
                  headingTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: tp),
                  dataTextStyle: TextStyle(fontSize: 13, color: tp),
                  columns: [
                    const DataColumn(label: SizedBox()),
                    const DataColumn(label: Text('Team')),
                    const DataColumn(label: Text('Captain')),
                    const DataColumn(label: Text('Registered')),
                    const DataColumn(label: Text('Status')),
                    const DataColumn(label: Text('Actions')),
                  ],
                  rows: filtered.asMap().entries.map((e) {
                    final i = _registrations.indexOf(e.value);
                    final r = e.value;
                    final statusColor = switch (r.status) {
                      'Approved' => AppColors.success,
                      'Pending' => AppColors.warning,
                      'Rejected' => AppColors.error,
                      _ => ts,
                    };
                    return DataRow(
                      selected: _selected.contains(i),
                      onLongPress: () => setState(() => _selected.contains(i) ? _selected.remove(i) : _selected.add(i)),
                      cells: [
                        DataCell(Checkbox(
                          value: _selected.contains(i),
                          onChanged: (v) => setState(() => v! ? _selected.add(i) : _selected.remove(i)),
                        )),
                        DataCell(Text(r.team, style: const TextStyle(fontWeight: FontWeight.w600))),
                        DataCell(Text(r.captain)),
                        DataCell(Text(r.date, style: TextStyle(fontSize: 12, color: ts))),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                          child: Text(r.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: statusColor)),
                        )),
                        DataCell(Row(mainAxisSize: MainAxisSize.min, children: [
                          if (r.status == 'Pending') ...[
                            IconButton(icon: const Icon(Icons.check_circle, size: 18, color: AppColors.success), onPressed: () => _updateStatus(i, 'Approved'), padding: EdgeInsets.zero, constraints: const BoxConstraints(minWidth: 28, minHeight: 28)),
                            IconButton(icon: const Icon(Icons.cancel, size: 18, color: AppColors.error), onPressed: () => _updateStatus(i, 'Rejected'), padding: EdgeInsets.zero, constraints: const BoxConstraints(minWidth: 28, minHeight: 28)),
                          ],
                          if (r.status != 'Pending') IconButton(icon: Icon(Icons.refresh, size: 18, color: ts), onPressed: () => _updateStatus(i, 'Pending'), padding: EdgeInsets.zero, constraints: const BoxConstraints(minWidth: 28, minHeight: 28)),
                        ])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _updateStatus(int i, String status) {
    setState(() { _registrations[i].status = status; });
  }

  void _bulkAction(String status) {
    setState(() {
      for (final i in _selected) {
        if (_registrations[i].status == 'Pending') _registrations[i].status = status;
      }
      _selected.clear();
    });
  }

  Widget _miniStat(String label, String value, Color color, Color cardColor, bool isDark) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withValues(alpha: 0.2))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color)),
        Text(label, style: TextStyle(fontSize: 10, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary)),
      ]),
    ));
  }
}

class _Registration {
  final String team;
  final String captain;
  final String date;
  String status;
  _Registration(this.team, this.captain, this.date, this.status);
}
