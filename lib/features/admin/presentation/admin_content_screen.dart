import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminContentScreen extends StatefulWidget {
  const AdminContentScreen({super.key});

  @override
  State<AdminContentScreen> createState() => _AdminContentScreenState();
}

class _AdminContentScreenState extends State<AdminContentScreen> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  final List<_Report> _reports = [
    _Report('Hamza Ali', 'Spam messages in team chat', 'RPT-001', 'Jun 10, 2026', 'High'),
    _Report('Waqas Javed', 'Abusive language during match', 'RPT-002', 'Jun 9, 2026', 'High'),
    _Report('User Group', 'Suspicious account activity', 'RPT-003', 'Jun 8, 2026', 'Medium'),
    _Report('Kamran Akmal', 'Fake tournament registration', 'RPT-004', 'Jun 7, 2026', 'Medium'),
    _Report('Anonymous', 'Inappropriate profile photo', 'RPT-005', 'Jun 6, 2026', 'Low'),
    _Report('Talha Mansoor', 'Match fixing allegations', 'RPT-006', 'Jun 5, 2026', 'High'),
  ];

  final List<_Flagged> _flaggedItems = [
    _Flagged('Tournament', 'Fake Cricket League 2026', 'No verified organizer', 'Jun 8, 2026'),
    _Flagged('Match', 'Strikers vs Kings (Exhibition)', 'Score manipulation suspected', 'Jun 7, 2026'),
    _Flagged('Profile', 'User #4521', 'Duplicate account detected', 'Jun 6, 2026'),
    _Flagged('Tournament', 'Unregistered T10 Blast', 'Missing required documents', 'Jun 5, 2026'),
  ];

  final List<_Announcement> _announcements = [
    _Announcement('Ramadan Tournament Registration Open', 'All teams can now register for the annual Ramadan Night Cricket League.', 'All Users', 'Jun 15, 2026', 'Active'),
    _Announcement('Platform Maintenance Notice', 'Scheduled maintenance on June 20th from 2:00 AM to 6:00 AM.', 'All Users', 'Jun 12, 2026', 'Active'),
    _Announcement('New Feature: Multi-Sport Stats', 'Players can now track stats across multiple sports.', 'Players', 'Jun 1, 2026', 'Expired'),
  ];

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() { _tabCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final tp = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final ts = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;
    final red = const Color(0xFFEF4444);

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width >= 900 ? 32 : 16, width >= 900 ? 32 : 16, width >= 900 ? 32 : 16, 0),
            child: Row(children: [
              Container(width: 48, height: 48,
                decoration: BoxDecoration(color: red.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(Icons.flag, color: red, size: 26)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Content Management', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                Text('Reports, flagged content, and announcements', style: TextStyle(fontSize: 13, color: ts)),
              ])),
            ]),
          ),
          const SizedBox(height: 8),
          TabBar(
            controller: _tabCtrl,
            indicatorColor: red,
            labelColor: red,
            unselectedLabelColor: ts,
            tabs: [
              Tab(text: 'Reports (${_reports.length})'),
              Tab(text: 'Flagged (${_flaggedItems.length})'),
              Tab(text: 'Announcements (${_announcements.length})'),
            ],
          ),
          Expanded(child: TabBarView(controller: _tabCtrl, children: [
            _buildReportsTab(bg, cardColor, tp, ts, red, isDark),
            _buildFlaggedTab(bg, cardColor, tp, ts, red, isDark),
            _buildAnnouncementsTab(bg, cardColor, tp, ts, red, isDark, width),
          ])),
        ],
      ),
    );
  }

  Widget _buildReportsTab(Color bg, Color cardColor, Color tp, Color ts, Color red, bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _reports.length,
      itemBuilder: (_, i) {
        final r = _reports[i];
        final severityColor = switch (r.severity) { 'High' => AppColors.error, 'Medium' => AppColors.warning, _ => AppColors.primary };
        return Card(color: cardColor, margin: const EdgeInsets.only(bottom: 10), child: Padding(padding: const EdgeInsets.all(16), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: severityColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                child: Text(r.severity, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: severityColor))),
              const SizedBox(width: 8),
              Text(r.id, style: TextStyle(fontSize: 11, color: ts)),
              const Spacer(),
              Text(r.date, style: TextStyle(fontSize: 11, color: ts)),
            ]),
            const SizedBox(height: 8),
            Text('Reported: ${r.reported}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: tp)),
            const SizedBox(height: 4),
            Text(r.reason, style: TextStyle(fontSize: 12, color: ts)),
            const SizedBox(height: 12),
            Row(children: [
              OutlinedButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Investigating ${r.id}'))),
                icon: const Icon(Icons.search, size: 16),
                label: const Text('Investigate'),
                style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: () => setState(() => _reports.removeAt(i)),
                icon: const Icon(Icons.check, size: 16),
                label: const Text('Resolve'),
                style: FilledButton.styleFrom(backgroundColor: AppColors.success, visualDensity: VisualDensity.compact),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () => setState(() => _reports.removeAt(i)),
                icon: const Icon(Icons.close, size: 16),
                label: const Text('Dismiss'),
                style: OutlinedButton.styleFrom(foregroundColor: ts, visualDensity: VisualDensity.compact),
              ),
            ]),
          ],
        )));
      },
    );
  }

  Widget _buildFlaggedTab(Color bg, Color cardColor, Color tp, Color ts, Color red, bool isDark) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _flaggedItems.length,
      itemBuilder: (_, i) {
        final f = _flaggedItems[i];
        return Card(color: cardColor, margin: const EdgeInsets.only(bottom: 10), child: Padding(padding: const EdgeInsets.all(16), child: Row(children: [
          Container(width: 42, height: 42,
            decoration: BoxDecoration(color: AppColors.warning.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
            child: Icon(switch (f.type) { 'Tournament' => Icons.emoji_events, 'Match' => Icons.sports_cricket, _ => Icons.person }, color: AppColors.warning, size: 22)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(f.type, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: red)),
              const SizedBox(width: 6),
              Text(f.title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: tp)),
            ]),
            Text(f.reason, style: TextStyle(fontSize: 11, color: ts)),
            Text(f.date, style: TextStyle(fontSize: 10, color: ts)),
          ])),
          Column(children: [
            IconButton(icon: const Icon(Icons.check_circle, size: 20, color: AppColors.success), onPressed: () => setState(() => _flaggedItems.removeAt(i)), padding: EdgeInsets.zero),
            IconButton(icon: const Icon(Icons.remove_circle, size: 20, color: AppColors.error), onPressed: () => setState(() => _flaggedItems.removeAt(i)), padding: EdgeInsets.zero),
          ]),
        ])));
      },
    );
  }

  Widget _buildAnnouncementsTab(Color bg, Color cardColor, Color tp, Color ts, Color red, bool isDark, double width) {
    return Column(children: [
      Padding(padding: const EdgeInsets.fromLTRB(16, 16, 16, 0), child: Align(alignment: Alignment.centerRight, child: FilledButton.icon(
        onPressed: () => _showCreateAnnouncementDialog(context, isDark, tp, ts, red),
        icon: const Icon(Icons.add, size: 18),
        label: const Text('New Announcement'),
        style: FilledButton.styleFrom(backgroundColor: red),
      ))),
      Expanded(child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _announcements.length,
        itemBuilder: (_, i) {
          final a = _announcements[i];
          final isActive = a.status == 'Active';
          return Card(color: cardColor, margin: const EdgeInsets.only(bottom: 10), child: Padding(padding: const EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: (isActive ? AppColors.success : ts).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                  child: Text(a.status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: isActive ? AppColors.success : ts))),
                const SizedBox(width: 8),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                  child: Text(a.audience, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary))),
                const Spacer(),
                Text(a.date, style: TextStyle(fontSize: 11, color: ts)),
              ]),
              const SizedBox(height: 10),
              Text(a.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: tp)),
              const SizedBox(height: 4),
              Text(a.body, style: TextStyle(fontSize: 12, color: ts, height: 1.5)),
            ],
          )));
        },
      )),
    ]);
  }

  void _showCreateAnnouncementDialog(BuildContext context, bool isDark, Color tp, Color ts, Color red) {
    final titleCtrl = TextEditingController();
    final bodyCtrl = TextEditingController();
    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: Text('Create Announcement', style: TextStyle(color: tp)),
      content: SizedBox(width: 400, child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(controller: titleCtrl, decoration: InputDecoration(labelText: 'Title')),
        const SizedBox(height: 12),
        TextFormField(controller: bodyCtrl, decoration: InputDecoration(labelText: 'Body'), maxLines: 3),
      ])),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        FilledButton(
          onPressed: () {
            if (titleCtrl.text.isNotEmpty) {
              setState(() => _announcements.insert(0, _Announcement(titleCtrl.text, bodyCtrl.text, 'All Users', 'Today', 'Active')));
              Navigator.pop(ctx);
            }
          },
          style: FilledButton.styleFrom(backgroundColor: red),
          child: const Text('Publish'),
        ),
      ],
    ));
  }
}

class _Report {
  final String reported;
  final String reason;
  final String id;
  final String date;
  final String severity;
  _Report(this.reported, this.reason, this.id, this.date, this.severity);
}

class _Flagged {
  final String type;
  final String title;
  final String reason;
  final String date;
  _Flagged(this.type, this.title, this.reason, this.date);
}

class _Announcement {
  final String title;
  final String body;
  final String audience;
  final String date;
  final String status;
  _Announcement(this.title, this.body, this.audience, this.date, this.status);
}
