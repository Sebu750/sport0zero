import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminAnalyticsScreen extends StatelessWidget {
  const AdminAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.backgroundDark : AppColors.background;
    final cardColor = isDark ? AppColors.surfaceDark : Colors.white;
    final tp = isDark ? AppColors.textPrimaryDark : AppColors.textPrimary;
    final ts = isDark ? AppColors.textSecondaryDark : AppColors.textSecondary;
    final width = MediaQuery.of(context).size.width;
    final red = const Color(0xFFEF4444);

    final signups = [
      ('Jan', 82), ('Feb', 124), ('Mar', 156), ('Apr', 198), ('May', 245), ('Jun', 312),
    ];
    final maxSignup = signups.map((e) => e.$2).reduce(max);

    final roleDist = [
      ('Players', 890, AppColors.primary),
      ('Managers', 185, AppColors.accent),
      ('Organizers', 94, Colors.purple.shade600),
      ('Admins', 15, red),
    ];
    final totalUsers = roleDist.fold<int>(0, (sum, e) => sum + e.$2);

    return Scaffold(
      backgroundColor: bg,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width >= 900 ? 32 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(width: 48, height: 48,
                decoration: BoxDecoration(color: red.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                child: Icon(Icons.insights, color: red, size: 26)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Platform Analytics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
                Text('Comprehensive overview of platform performance', style: TextStyle(fontSize: 13, color: ts)),
              ])),
            ]),
            const SizedBox(height: 24),

            // KPI Cards
            Row(children: [
              _kpiCard('Total Matches', '2,847', '+12%', Icons.sports_cricket, AppColors.primary, cardColor, isDark),
              const SizedBox(width: 10),
              _kpiCard('Active Tournaments', '34', '+8%', Icons.emoji_events, Colors.purple.shade600, cardColor, isDark),
              const SizedBox(width: 10),
              _kpiCard('User Growth', '+18.4%', 'This month', Icons.trending_up, AppColors.success, cardColor, isDark),
              const SizedBox(width: 10),
              _kpiCard('Revenue', '2.4M PKR', '+22%', Icons.monetization_on, AppColors.accent, cardColor, isDark),
            ]),
            const SizedBox(height: 28),

            // Charts row
            width >= 900
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _buildSignupChart(cardColor, tp, ts, signups, maxSignup, isDark)),
                      const SizedBox(width: 20),
                      Expanded(flex: 2, child: _buildRoleDistribution(cardColor, tp, ts, roleDist, totalUsers, isDark)),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSignupChart(cardColor, tp, ts, signups, maxSignup, isDark),
                      const SizedBox(height: 20),
                      _buildRoleDistribution(cardColor, tp, ts, roleDist, totalUsers, isDark),
                    ],
                  ),
            const SizedBox(height: 28),

            // Activity feed
            _buildActivityFeed(cardColor, tp, ts, red, isDark),
          ],
        ),
      ),
    );
  }

  Widget _kpiCard(String label, String value, String delta, IconData icon, Color color, Color cardColor, bool isDark) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(14), border: Border.all(color: color.withValues(alpha: 0.15))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 36, height: 36, decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 18)),
          const Spacer(),
          Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
            child: Text(delta, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.success))),
        ]),
        const SizedBox(height: 12),
        Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary)),
        Text(label, style: TextStyle(fontSize: 11, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary)),
      ]),
    ));
  }

  Widget _buildSignupChart(Color cardColor, Color tp, Color ts, List<(String, int)> data, int maxVal, bool isDark) {
    return Card(color: cardColor, child: Padding(padding: const EdgeInsets.all(24), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.bar_chart, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Text('Monthly Signups', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
          const Spacer(),
          Text('Last 6 months', style: TextStyle(fontSize: 11, color: ts)),
        ]),
        const SizedBox(height: 24),
        SizedBox(height: 180, child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: data.map((e) {
          final h = (e.$2 / maxVal) * 140;
          return Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${e.$2}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: tp)),
              const SizedBox(height: 4),
              Container(height: h, decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColors.primary, AppColors.primaryLight]),
                borderRadius: BorderRadius.circular(6),
              )),
              const SizedBox(height: 6),
              Text(e.$1, style: TextStyle(fontSize: 11, color: ts)),
            ],
          )));
        }).toList())),
      ],
    )));
  }

  Widget _buildRoleDistribution(Color cardColor, Color tp, Color ts, List<(String, int, Color)> data, int total, bool isDark) {
    return Card(color: cardColor, child: Padding(padding: const EdgeInsets.all(24), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.pie_chart, color: Colors.purple.shade600, size: 20),
          const SizedBox(width: 8),
          Text('User Distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
        ]),
        const SizedBox(height: 20),
        // Simple donut representation
        Center(child: SizedBox(width: 120, height: 120, child: Stack(children: [
          ...data.asMap().entries.map((e) {
            final pct = e.value.$2 / total;
            final startAngle = data.take(e.key).fold<double>(0, (s, x) => s + (x.$2 / total) * 360);
            return CustomPaint(
              size: const Size(120, 120),
              painter: _DonutSegmentPainter(e.value.$3, startAngle, pct * 360),
            );
          }),
          Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('$total', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: tp)),
            Text('Total', style: TextStyle(fontSize: 10, color: ts)),
          ])),
        ]))),
        const SizedBox(height: 20),
        ...data.map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: Row(children: [
          Container(width: 10, height: 10, decoration: BoxDecoration(color: e.$3, borderRadius: BorderRadius.circular(3))),
          const SizedBox(width: 8),
          Text(e.$1, style: TextStyle(fontSize: 12, color: tp)),
          const Spacer(),
          Text('${e.$2} (${((e.$2 / total) * 100).toStringAsFixed(0)}%)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: tp)),
        ]))),
      ],
    )));
  }

  Widget _buildActivityFeed(Color cardColor, Color tp, Color ts, Color red, bool isDark) {
    final activities = [
      ('New user registered', 'Haseeb Ahmed joined as Player', '2 min ago', AppColors.success),
      ('Tournament created', 'Ramadan Night League by Ahmed Raza', '15 min ago', Colors.purple.shade600),
      ('Match completed', 'Lahore Strikers vs Karachi Kings (3-1)', '1 hr ago', AppColors.primary),
      ('User flagged', 'Hamza Ali reported for spam', '3 hr ago', AppColors.error),
      ('Registration approved', 'Multan Sultans approved for RNL', '5 hr ago', AppColors.success),
    ];

    return Card(color: cardColor, child: Padding(padding: const EdgeInsets.all(24), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.timeline, color: red, size: 20),
          const SizedBox(width: 8),
          Text('Recent Activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: tp)),
        ]),
        const SizedBox(height: 16),
        ...activities.map((a) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: a.$4, shape: BoxShape.circle)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(a.$1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: tp)),
            Text(a.$2, style: TextStyle(fontSize: 11, color: ts)),
          ])),
          Text(a.$3, style: TextStyle(fontSize: 10, color: ts)),
        ]))),
      ],
    )));
  }
}

class _DonutSegmentPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double sweepAngle;

  _DonutSegmentPainter(this.color, this.startAngle, this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 9),
      (startAngle - 90) * pi / 180,
      sweepAngle * pi / 180,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
