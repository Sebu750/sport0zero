import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  String _search = '';
  String _roleFilter = 'All';

  final List<_User> _users = [
    _User('Haseeb Ahmed', 'haseeb@mail.com', 'Player', 'Active', 'Jan 15, 2025'),
    _User('Sara Khan', 'sara@mail.com', 'Manager', 'Active', 'Feb 3, 2025'),
    _User('Ahmed Raza', 'ahmed@mail.com', 'Organizer', 'Active', 'Feb 10, 2025'),
    _User('Admin User', 'admin@sport0zero.com', 'Admin', 'Active', 'Jan 1, 2025'),
    _User('Bilal Khan', 'bilal@mail.com', 'Player', 'Active', 'Mar 5, 2025'),
    _User('Usman Tariq', 'usman@mail.com', 'Player', 'Suspended', 'Mar 12, 2025'),
    _User('Zain Malik', 'zain@mail.com', 'Player', 'Active', 'Mar 18, 2025'),
    _User('Fahad Raza', 'fahad@mail.com', 'Manager', 'Active', 'Apr 1, 2025'),
    _User('Hamza Ali', 'hamza@mail.com', 'Player', 'Flagged', 'Apr 8, 2025'),
    _User('Saad Iqbal', 'saad@mail.com', 'Player', 'Active', 'Apr 15, 2025'),
    _User('Talha Mansoor', 'talha@mail.com', 'Organizer', 'Active', 'May 2, 2025'),
    _User('Waqas Javed', 'waqas@mail.com', 'Player', 'Active', 'May 10, 2025'),
    _User('Nabeel Ashraf', 'nabeel@mail.com', 'Player', 'Active', 'May 20, 2025'),
    _User('Arslan Butt', 'arslan@mail.com', 'Manager', 'Active', 'Jun 1, 2025'),
    _User('Rizwan Haider', 'rizwan@mail.com', 'Player', 'Active', 'Jun 8, 2025'),
    _User('Kamran Akmal', 'kamran@mail.com', 'Player', 'Suspended', 'Jun 15, 2025'),
    _User('Imran Shahid', 'imran@mail.com', 'Organizer', 'Active', 'Jul 1, 2025'),
    _User('Ali Raza', 'ali@mail.com', 'Player', 'Active', 'Jul 10, 2025'),
  ];

  List<_User> get _filtered {
    return _users.where((u) {
      final matchesSearch = u.name.toLowerCase().contains(_search.toLowerCase()) || u.email.toLowerCase().contains(_search.toLowerCase());
      final matchesRole = _roleFilter == 'All' || u.role == _roleFilter;
      return matchesSearch && matchesRole;
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
    final red = const Color(0xFFEF4444);

    final total = _users.length;
    final active = _users.where((u) => u.status == 'Active').length;
    final suspended = _users.where((u) => u.status == 'Suspended').length;
    final flagged = _users.where((u) => u.status == 'Flagged').length;
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
              Container(width: 48, height: 48,
                decoration: BoxDecoration(color: red.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(Icons.people, color: red, size: 26)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('User Management', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                Text('$total registered users · $active active', style: TextStyle(fontSize: 13, color: ts)),
              ])),
            ]),
            const SizedBox(height: 20),

            // Stats
            Row(children: [
              _miniStat('Total Users', '$total', AppColors.primary, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Active', '$active', AppColors.success, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Suspended', '$suspended', AppColors.warning, cardColor, isDark),
              const SizedBox(width: 10),
              _miniStat('Flagged', '$flagged', AppColors.error, cardColor, isDark),
            ]),
            const SizedBox(height: 20),

            // Search + filters
            Row(children: [
              Expanded(child: TextFormField(
                onChanged: (v) => setState(() => _search = v),
                decoration: InputDecoration(
                  hintText: 'Search by name or email...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              )),
            ]),
            const SizedBox(height: 10),
            Wrap(spacing: 6, runSpacing: 6, children: ['All', 'Player', 'Manager', 'Organizer', 'Admin'].map((r) => FilterChip(
              label: Text(r, style: const TextStyle(fontSize: 11)),
              selected: _roleFilter == r,
              onSelected: (_) => setState(() => _roleFilter = r),
              selectedColor: red.withValues(alpha: 0.12),
              checkmarkColor: red,
            )).toList()),
            const SizedBox(height: 16),

            // Users table
            Card(
              color: cardColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStatePropertyAll(red.withValues(alpha: 0.06)),
                    headingTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: tp),
                    dataTextStyle: TextStyle(fontSize: 13, color: tp),
                    columns: const [
                      DataColumn(label: Text('User')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Joined')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: filtered.map((u) {
                      final statusColor = switch (u.status) {
                        'Active' => AppColors.success,
                        'Suspended' => AppColors.warning,
                        'Flagged' => AppColors.error,
                        _ => ts,
                      };
                      final roleColor = switch (u.role) {
                        'Player' => AppColors.primary,
                        'Manager' => AppColors.accent,
                        'Organizer' => Colors.purple.shade600,
                        'Admin' => red,
                        _ => ts,
                      };
                      return DataRow(cells: [
                        DataCell(Row(children: [
                          CircleAvatar(radius: 14, backgroundColor: roleColor.withValues(alpha: 0.12),
                            child: Text(u.name[0], style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: roleColor))),
                          const SizedBox(width: 8),
                          Text(u.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        ])),
                        DataCell(Text(u.email, style: TextStyle(fontSize: 12, color: ts))),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: roleColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                          child: Text(u.role, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: roleColor)),
                        )),
                        DataCell(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                          child: Text(u.status, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: statusColor)),
                        )),
                        DataCell(Text(u.joined, style: TextStyle(fontSize: 12, color: ts))),
                        DataCell(PopupMenuButton<String>(
                          icon: Icon(Icons.more_vert, size: 18, color: ts),
                          padding: EdgeInsets.zero,
                          onSelected: (action) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$action: ${u.name}')));
                          },
                          itemBuilder: (_) => [
                            const PopupMenuItem(value: 'View Profile', child: Text('View Profile')),
                            if (u.status != 'Suspended') const PopupMenuItem(value: 'Suspend', child: Text('Suspend')),
                            if (u.status == 'Suspended') const PopupMenuItem(value: 'Reactivate', child: Text('Reactivate')),
                            const PopupMenuItem(value: 'Change Role', child: Text('Change Role')),
                            if (u.status == 'Flagged') const PopupMenuItem(value: 'Resolve Flag', child: Text('Resolve Flag')),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text('Showing ${filtered.length} of ${_users.length} users', style: TextStyle(fontSize: 12, color: ts)),
          ],
        ),
      ),
    );
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

class _User {
  final String name;
  final String email;
  final String role;
  String status;
  final String joined;
  _User(this.name, this.email, this.role, this.status, this.joined);
}
