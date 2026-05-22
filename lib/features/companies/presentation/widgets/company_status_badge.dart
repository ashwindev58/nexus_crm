import 'package:flutter/material.dart';

class CompanyStatusBadge extends StatelessWidget {
  final String status;

  const CompanyStatusBadge({
    super.key,
    required this.status,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFF10B981); // Solid Green
      case 'pending':
        return const Color(0xFFF59E0B); // Amber
      case 'inactive':
        return const Color(0xFF94A3B8); // Slate Grey
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: statusColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
