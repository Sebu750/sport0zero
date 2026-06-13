import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/mock/dashboard_mock_data.dart';

class TeamsScreen extends ConsumerWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(myTeamsProvider);
    final requests = ref.watch(teamRequestsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Teams'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My Teams'),
              Tab(text: 'Requests'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showCreateTeamSheet(context),
          icon: const Icon(Icons.add),
          label: const Text('Create Team'),
        ),
        body: TabBarView(
          children: [
            _buildMyTeamsTab(teams),
            _buildRequestsTab(requests),
          ],
        ),
      ),
    );
  }

  Widget _buildMyTeamsTab(List<dynamic> teams) {
    if (teams.isEmpty) {
      return EmptyState(
        icon: Icons.groups,
        title: 'No teams yet',
        subtitle: 'Create or join a team to get started',
        action: FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Create Team'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: teams.length,
      itemBuilder: (context, i) {
        final team = teams[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            splashColor: AppColors.primary.withValues(alpha: 0.04),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Team logo — gradient pill
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 8, offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        (team.shortName ?? team.name.substring(0, 3)).toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          team.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.people_outline, size: 14, color: AppColors.textSecondary),
                            const SizedBox(width: 4),
                            Text(
                              '${team.playerIds.length} players',
                              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                            ),
                            const SizedBox(width: 12),
                            Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                team.homeGround ?? 'No ground set',
                                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRequestsTab(List<TeamRequest> requests) {
    if (requests.isEmpty) {
      return const EmptyState(
        icon: Icons.mail_outline,
        title: 'No pending requests',
        subtitle: 'Join requests will appear here',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: requests.length,
      itemBuilder: (context, i) {
        final req = requests[i];
        final isIncoming = req.type == 'incoming';
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isIncoming
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : AppColors.accent.withValues(alpha: 0.1),
              child: Icon(
                isIncoming ? Icons.person_add : Icons.exit_to_app,
                color: isIncoming ? AppColors.primary : AppColors.accent,
                size: 20,
              ),
            ),
            title: Text(
              isIncoming ? req.playerName : req.teamName,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              isIncoming
                  ? 'Wants to join ${req.teamName}'
                  : 'Your request to join',
              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            trailing: isIncoming && req.status == 'pending'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check_circle, color: AppColors.success, size: 22),
                        onPressed: () {},
                        tooltip: 'Accept',
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel_outlined, color: AppColors.error, size: 22),
                        onPressed: () {},
                        tooltip: 'Decline',
                      ),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: req.status == 'pending'
                          ? AppColors.warning.withValues(alpha: 0.1)
                          : AppColors.divider,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      req.status.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: req.status == 'pending' ? AppColors.warning : AppColors.textSecondary,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  void _showCreateTeamSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            24, 24, 24, MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Create Team',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Team Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Short Name (3 letters)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                maxLength: 3,
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Sport',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: 'Cricket',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Create Team'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
