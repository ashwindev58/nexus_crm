import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nexus_crm/features/companies/data/models/company_model.dart';
import '../shared/company_status_badge.dart';

class CompanyDetailsHeader extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailsHeader({super.key, required this.company});

  String _getInitials(String name) {
    if (name.isEmpty) return 'CO';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, min(2, name.length)).toUpperCase();
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFF10B981);
      case 'pending':
        return const Color(0xFFF59E0B);
      case 'inactive':
        return const Color(0xFF94A3B8);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(company.company.name);
    final statusColor = _getStatusColor(company.status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E7FF),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Color(0xFF4F46E5),
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF8FAFC),
                    width: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              company.company.name,
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            CompanyStatusBadge(status: company.status),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          company.company.catchPhrase,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
