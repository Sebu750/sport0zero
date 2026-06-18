import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/models/user_model.dart';
import '../../../core/constants/app_constants.dart';

/// Landing page — users pick their role to enter the platform.
/// Route: /
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 700;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D1B2A), Color(0xFF1B263B), Color(0xFF0D1B2A)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Brand
                    Icon(Icons.sports_soccer, size: isDesktop ? 72 : 56, color: AppColors.primary),
                    const SizedBox(height: 16),
                    Text(
                      'Sport0Zero',
                      style: TextStyle(
                        fontSize: isDesktop ? 48 : 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your sports companion',
                      style: TextStyle(fontSize: isDesktop ? 16 : 14, color: Colors.white60),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.greenAccent.withValues(alpha: 0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.bolt, size: 14, color: Colors.greenAccent),
                          const SizedBox(width: 6),
                          Text('Instant Demo Mode', style: TextStyle(fontSize: 12, color: Colors.greenAccent, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 56),

                    // Heading
                    Text(
                      'Choose Your Role',
                      style: TextStyle(fontSize: isDesktop ? 22 : 18, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Each role has a different dashboard and feature set.\nClick a card to enter instantly — no password needed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white54, height: 1.6),
                    ),
                    const SizedBox(height: 32),

                    // Role cards grid
                    LayoutBuilder(builder: (context, constraints) {
                      final wide = constraints.maxWidth >= 600;
                      final cardWidth = wide
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth;
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: UserRole.values.map((role) {
                          return _RoleCard(role: role, width: cardWidth, isDesktop: isDesktop);
                        }).toList(),
                      );
                    }),
                    const SizedBox(height: 48),

                    // Footer
                    Text(
                      'Demo data is pre-populated. No account or Firebase connection required.',
                      style: TextStyle(fontSize: 11, color: Colors.white24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final UserRole role;
  final double width;
  final bool isDesktop;

  const _RoleCard({required this.role, required this.width, required this.isDesktop});

  IconData get _icon => switch (role) {
    UserRole.player    => Icons.sports_cricket,
    UserRole.manager   => Icons.manage_accounts,
    UserRole.organizer => Icons.emoji_events,
    UserRole.admin     => Icons.admin_panel_settings,
  };

  Color get _color => switch (role) {
    UserRole.player    => const Color(0xFF3B82F6),
    UserRole.manager   => const Color(0xFFF97316),
    UserRole.organizer => const Color(0xFFA855F7),
    UserRole.admin     => const Color(0xFFEF4444),
  };

  String get _label => switch (role) {
    UserRole.player    => 'Player',
    UserRole.manager   => 'Team Manager',
    UserRole.organizer => 'Tournament Organizer',
    UserRole.admin     => 'Platform Admin',
  };

  String get _desc => switch (role) {
    UserRole.player    => 'View your stats, join matches,\ntrack teams & tournaments',
    UserRole.manager   => 'Manage rosters, player availability,\nteam performance & fixtures',
    UserRole.organizer => 'Create tournaments, manage\nregistrations & build fixtures',
    UserRole.admin     => 'User management, analytics,\nplatform content & moderation',
  };

  String get _route => switch (role) {
    UserRole.player    => '/player',
    UserRole.manager   => '/manager',
    UserRole.organizer => '/organizer',
    UserRole.admin     => '/admin',
  };

  String get _email => AppConstants.demoAccounts[role]!.email;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(_route),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _color.withValues(alpha: 0.35), width: 1.5),
            boxShadow: [
              BoxShadow(color: _color.withValues(alpha: 0.08), blurRadius: 20, offset: const Offset(0, 8)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon + label row
              Row(children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: _color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(_icon, color: _color, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_label, style: TextStyle(fontSize: isDesktop ? 17 : 15, fontWeight: FontWeight.w800, color: Colors.white)),
                    Text(_email, style: TextStyle(fontSize: 11, color: _color.withValues(alpha: 0.7))),
                  ],
                )),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white24),
              ]),
              const SizedBox(height: 14),
              Text(
                _desc,
                style: TextStyle(fontSize: 12, color: Colors.white54, height: 1.7),
              ),
              const SizedBox(height: 16),
              // CTA pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: _color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _color.withValues(alpha: 0.4)),
                ),
                child: Text(
                  'Enter as $_label →',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
