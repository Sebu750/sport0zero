import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Status type for matches, tournaments, etc.
enum StatusType { live, upcoming, ongoing, completed, cancelled, postponed }

/// Colored status chip.
class StatusChip extends StatelessWidget {
  final StatusType status;
  final String? label;
  final double fontSize;

  const StatusChip({
    super.key,
    required this.status,
    this.label,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    final (String text, Color color, bool showDot) = switch (status) {
      StatusType.live => ('LIVE', AppColors.live, true),
      StatusType.upcoming => ('Upcoming', AppColors.primary, false),
      StatusType.ongoing => ('Ongoing', AppColors.success, true),
      StatusType.completed => ('Completed', AppColors.textSecondary, false),
      StatusType.cancelled => ('Cancelled', AppColors.error, false),
      StatusType.postponed => ('Postponed', AppColors.warning, false),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label ?? text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
