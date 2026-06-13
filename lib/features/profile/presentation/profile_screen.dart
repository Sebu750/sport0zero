import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final isLoggedIn = authState.isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User info card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                    child: user?.photoUrl != null
                        ? ClipOval(
                            child: Image.network(
                              user!.photoUrl!,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.person,
                            size: 32,
                            color: AppColors.primary),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'Guest User',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isLoggedIn
                              ? (user?.email ?? 'Signed in')
                              : 'Sign in to sync your data',
                          style: const TextStyle(
                              color: AppColors.textSecondary, fontSize: 13),
                        ),
                        if (user?.verified == true) ...[
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.verified,
                                  size: 14, color: AppColors.success),
                              const SizedBox(width: 4),
                              const Text('Verified',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.success,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (!isLoggedIn)
                    FilledButton.tonal(
                      onPressed: () => context.go('/login'),
                      child: const Text('Sign In'),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Settings section
          const Text('Settings',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary)),
          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Theme'),
                  trailing: SegmentedButton<AppThemeMode>(
                    segments: const [
                      ButtonSegment(
                          value: AppThemeMode.system, label: Text('Auto')),
                      ButtonSegment(
                          value: AppThemeMode.light, label: Text('Light')),
                      ButtonSegment(
                          value: AppThemeMode.dark, label: Text('Dark')),
                    ],
                    selected: {themeMode},
                    onSelectionChanged: (selection) {
                      ref
                          .read(themeProvider.notifier)
                          .setTheme(selection.first);
                    },
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notifications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // About section
          const Text('About',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About Sport0Zero'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Logout button
          if (isLoggedIn)
            Card(
              color: AppColors.error.withValues(alpha: 0.05),
              child: ListTile(
                leading: const Icon(Icons.logout, color: AppColors.error),
                title: const Text('Log Out',
                    style: TextStyle(color: AppColors.error)),
                onTap: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Log Out'),
                      content:
                          const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: const Text('Log Out'),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true && context.mounted) {
                    await ref.read(authProvider.notifier).logout();
                    if (context.mounted) context.go('/login');
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
