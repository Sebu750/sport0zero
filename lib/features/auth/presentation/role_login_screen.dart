import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/providers/app_providers.dart';
import '../data/auth_repository.dart';

/// Role-specific login page. Route: /player, /manager, /organizer, /admin
/// Each page is branded for its role with an instant demo login button.
class RoleLoginScreen extends ConsumerStatefulWidget {
  final UserRole role;
  const RoleLoginScreen({super.key, required this.role});

  @override
  ConsumerState<RoleLoginScreen> createState() => _RoleLoginScreenState();
}

class _RoleLoginScreenState extends ConsumerState<RoleLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Instant mock login — no Firebase
  void _handleDemoLogin() {
    final repo = ref.read(authProvider.notifier);
    repo.demoLogin(widget.role);
    if (mounted) context.go('/dashboard');
  }

  // Real Firebase login
  Future<void> _handleManualLogin() async {
    if (!_formKey.currentState!.validate()) return;
    final repo = ref.read(authProvider.notifier);
    final success = await repo.login(
      _emailController.text.trim(),
      _passwordController.text,
    );
    if (success && mounted) context.go('/dashboard');
  }

  IconData get _icon => switch (widget.role) {
    UserRole.player    => Icons.sports_cricket,
    UserRole.manager   => Icons.manage_accounts,
    UserRole.organizer => Icons.emoji_events,
    UserRole.admin     => Icons.admin_panel_settings,
  };

  Color get _color => switch (widget.role) {
    UserRole.player    => const Color(0xFF3B82F6),
    UserRole.manager   => const Color(0xFFF97316),
    UserRole.organizer => const Color(0xFFA855F7),
    UserRole.admin     => const Color(0xFFEF4444),
  };

  String get _roleLabel => switch (widget.role) {
    UserRole.player    => 'Player',
    UserRole.manager   => 'Team Manager',
    UserRole.organizer => 'Tournament Organizer',
    UserRole.admin     => 'Platform Admin',
  };

  String get _roleDesc => switch (widget.role) {
    UserRole.player    => 'View stats, join matches, track teams and tournaments.',
    UserRole.manager   => 'Manage rosters, player availability and team performance.',
    UserRole.organizer => 'Create tournaments, manage registrations and build fixtures.',
    UserRole.admin     => 'User management, analytics and platform administration.',
  };

  List<String> get _features => switch (widget.role) {
    UserRole.player    => ['Personal stats & rating', 'Join & view teams', 'Upcoming matches', 'Tournament brackets'],
    UserRole.manager   => ['Manage multiple teams', 'Roster & availability', 'Fixture scheduling', 'Player requests'],
    UserRole.organizer => ['Create tournaments', 'Registration management', 'Fixture generation', 'Score reporting'],
    UserRole.admin     => ['User management', 'Platform analytics', 'Content moderation', 'System settings'],
  };

  String get _demoEmail => AppConstants.demoAccounts[widget.role]!.email;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.status == AuthStatus.loading;
    final isDesktop = MediaQuery.of(context).size.width >= 700;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _color.withValues(alpha: 0.08),
              const Color(0xFF0F172A),
              const Color(0xFF0F172A),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Back to home
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => context.go('/'),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios_new, size: 13, color: Colors.white38),
                            const SizedBox(width: 4),
                            Text('Back', style: TextStyle(fontSize: 13, color: Colors.white38)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Role icon + name
                    Container(
                      width: 72, height: 72,
                      decoration: BoxDecoration(
                        color: _color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: _color.withValues(alpha: 0.4), width: 1.5),
                      ),
                      child: Icon(_icon, color: _color, size: 36),
                    ),
                    const SizedBox(height: 20),
                    Text(_roleLabel, style: TextStyle(fontSize: isDesktop ? 32 : 26, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.5)),
                    const SizedBox(height: 8),
                    Text(_roleDesc, style: TextStyle(fontSize: 14, color: Colors.white54, height: 1.5)),
                    const SizedBox(height: 28),

                    // Features list
                    ..._features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Icon(Icons.check_circle, size: 16, color: _color.withValues(alpha: 0.7)),
                        const SizedBox(width: 10),
                        Expanded(child: Text(f, style: TextStyle(fontSize: 13, color: Colors.white70))),
                      ]),
                    )),
                    const SizedBox(height: 32),

                    // Demo login button
                    SizedBox(
                      height: 52,
                      child: FilledButton(
                        onPressed: isLoading ? null : _handleDemoLogin,
                        style: FilledButton.styleFrom(
                          backgroundColor: _color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: isLoading
                            ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Icon(Icons.bolt, size: 18),
                                const SizedBox(width: 8),
                                Text('Enter as Demo $_roleLabel', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                              ]),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        _demoEmail,
                        style: TextStyle(fontSize: 11, color: _color.withValues(alpha: 0.6)),
                      ),
                    ),
                    const SizedBox(height: 36),

                    // Divider
                    Row(children: [
                      const Expanded(child: Divider(color: Colors.white12)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text('or sign in with credentials', style: TextStyle(fontSize: 11, color: Colors.white24)),
                      ),
                      const Expanded(child: Divider(color: Colors.white12)),
                    ]),
                    const SizedBox(height: 24),

                    // Error banner
                    if (authState.errorMessage != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(children: [
                          const Icon(Icons.error_outline, color: AppColors.error, size: 18),
                          const SizedBox(width: 8),
                          Expanded(child: Text(authState.errorMessage!, style: const TextStyle(color: AppColors.error, fontSize: 12))),
                        ]),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Manual login form
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white38),
                            prefixIcon: Icon(Icons.email_outlined, color: Colors.white30),
                            filled: true,
                            fillColor: Colors.white.withValues(alpha: 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: _color.withValues(alpha: 0.7)),
                            ),
                          ),
                          validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white38),
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.white30),
                            filled: true,
                            fillColor: Colors.white.withValues(alpha: 0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: _color.withValues(alpha: 0.7)),
                            ),
                          ),
                          validator: (v) => (v == null || v.isEmpty) ? 'Enter your password' : null,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => context.go('/forgot-password'),
                            child: Text('Forgot Password?', style: TextStyle(fontSize: 12, color: _color)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: isLoading ? null : _handleManualLogin,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white70,
                              side: BorderSide(color: Colors.white24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text('Sign In', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 24),

                    // Sign up link
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Don't have an account? ", style: TextStyle(fontSize: 13, color: Colors.white38)),
                      GestureDetector(
                        onTap: () => context.go('/signup'),
                        child: Text('Sign Up', style: TextStyle(fontSize: 13, color: _color, fontWeight: FontWeight.w700)),
                      ),
                    ]),
                    const SizedBox(height: 24),
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
