import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

class CompanyTeamStack extends StatelessWidget {
  final List<String> teamAvatars;
  final String status;

  const CompanyTeamStack({
    super.key,
    required this.teamAvatars,
    required this.status,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.success; // Solid Green
      case 'pending':
        return AppColors.warning; // Amber
      case 'inactive':
        return AppColors.textMuted; // Slate Grey
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (teamAvatars.isEmpty) return const SizedBox.shrink();
    final baseColor = _getStatusColor();
    
    return SizedBox(
      width: 24.0 + (teamAvatars.length - 1) * 14.0,
      height: 24,
      child: Stack(
        children: List.generate(teamAvatars.length, (index) {
          final letter = teamAvatars[index];
          return Positioned(
            left: index * 14.0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: CircleAvatar(
                radius: 11,
                backgroundColor: baseColor.withValues(alpha: 0.1),
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: baseColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
