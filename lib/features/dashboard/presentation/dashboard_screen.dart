import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/user_model.dart';
import '../../../shared/providers/app_providers.dart';
import 'player_dashboard.dart';
import 'manager_dashboard.dart';
import 'organizer_dashboard.dart';
import 'admin_dashboard.dart';

/// Smart dispatcher: watches the current user role and renders the
/// correct role-specific dashboard.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(currentRoleProvider);
    return switch (role) {
      UserRole.player    => const PlayerDashboard(),
      UserRole.manager   => const ManagerDashboard(),
      UserRole.organizer => const OrganizerDashboard(),
      UserRole.admin     => const AdminDashboard(),
    };
  }
}
