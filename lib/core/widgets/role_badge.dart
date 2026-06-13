import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../../shared/models/user_model.dart';

/// Colored badge displaying a user role.
class RoleBadge extends StatelessWidget {
  final UserRole role;
  final double fontSize;

  const RoleBadge({
    super.key,
    required this.role,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    final (String label, Color color) = switch (role) {
      UserRole.player => ('Player', AppColors.primary),
      UserRole.manager => ('Manager', AppColors.accent),
      UserRole.organizer => ('Organizer', Colors.purple.shade600),
      UserRole.admin => ('Admin', AppColors.error),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Row of role badges for a user with multiple roles.
class RoleBadges extends StatelessWidget {
  final List<UserRole> roles;
  final double fontSize;

  const RoleBadges({
    super.key,
    required this.roles,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: roles.map((r) => RoleBadge(role: r, fontSize: fontSize)).toList(),
    );
  }
}
