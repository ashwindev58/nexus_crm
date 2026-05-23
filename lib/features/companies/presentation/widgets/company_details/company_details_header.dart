import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import 'package:nexus_crm/features/companies/data/models/company_model.dart';
import '../../../../../core/constants/app_constants.dart';
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
        return AppColors.success;
      case 'pending':
        return AppColors.warning;
      case 'inactive':
        return AppColors.textMuted;
      default:
        return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initials = _getInitials(company.company.name);
    final statusColor = _getStatusColor(company.status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSizes.m),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: AppSizes.avatarL,
              height: AppSizes.avatarL,
              decoration: const BoxDecoration(
                color: AppColors.containerLightIndigo,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: AppColors.primaryContainer,
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
                    color: AppColors.backgroundSlate,
                    width: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.l),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                company.company.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: AppSizes.s),
            CompanyStatusBadge(status: company.status),
          ],
        ),
        const SizedBox(height: AppSizes.s),
        Text(
          company.company.catchPhrase,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
