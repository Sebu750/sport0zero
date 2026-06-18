import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account section
          _sectionLabel('Account'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Display Name'),
                  subtitle: Text(user?.displayName ?? 'Not set'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/edit-profile'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(user?.email ?? 'Not set'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/edit-profile'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('Phone'),
                  subtitle: Text(user?.phone ?? 'Not set'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/edit-profile'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Privacy section
          _sectionLabel('Privacy'),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.visibility_outlined),
                  title: const Text('Public Profile'),
                  subtitle: const Text('Allow others to view your profile', style: TextStyle(fontSize: 12)),
                  value: true,
                  onChanged: (v) {},
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.person_add_outlined),
                  title: const Text('Allow Join Requests'),
                  subtitle: const Text('Anyone can send you a team join request', style: TextStyle(fontSize: 12)),
                  value: true,
                  onChanged: (v) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Notifications section
          _sectionLabel('Notifications'),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.sports_cricket),
                  title: const Text('Match Reminders'),
                  value: true,
                  onChanged: (v) {},
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.groups),
                  title: const Text('Team Invites'),
                  value: true,
                  onChanged: (v) {},
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.emoji_events),
                  title: const Text('Tournament Updates'),
                  value: true,
                  onChanged: (v) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Theme section
          _sectionLabel('Appearance'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.palette_outlined),
                  const SizedBox(width: 16),
                  const Expanded(child: Text('Theme')),
                  SegmentedButton<AppThemeMode>(
                    segments: const [
                      ButtonSegment(value: AppThemeMode.system, label: Text('Auto')),
                      ButtonSegment(value: AppThemeMode.light, label: Text('Light')),
                      ButtonSegment(value: AppThemeMode.dark, label: Text('Dark')),
                    ],
                    selected: {themeMode},
                    onSelectionChanged: (selection) {
                      ref.read(themeProvider.notifier).setTheme(selection.first);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Logout
          Card(
            color: AppColors.error.withValues(alpha: 0.04),
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.error, width: 4)),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: AppColors.error),
                title: const Text('Log Out', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600)),
                onTap: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                      FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Log Out')),
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
          ),
          const SizedBox(height: 16),

          // Danger Zone: Delete Account
          Card(
            color: AppColors.error.withValues(alpha: 0.04),
            child: Container(
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.error, width: 4)),
              ),
              child: ListTile(
                leading: const Icon(Icons.delete_forever, color: AppColors.error),
                title: const Text('Delete Account',
                    style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600)),
                subtitle: const Text('Permanently delete your account and all data',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                onTap: () => _showDeleteDialog(context, ref),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text('Sport0Zero v1.0.0',
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary.withValues(alpha: 0.7))),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Account',
            style: TextStyle(color: AppColors.error)),
        content: const Text(
          'This action is irreversible. Your profile, match history, and all data will be permanently deleted.\n\nAre you sure?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete Permanently'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      final success = await ref.read(authProvider.notifier).deleteAccount();
      if (context.mounted) {
        if (success) {
          context.go('/login');
        } else {
          final errMsg = ref.read(authProvider).errorMessage ?? 'Failed to delete account.';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errMsg), backgroundColor: AppColors.error),
          );
        }
      }
    }
  }
}
