import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../../../core/constants/app_constants.dart';

class CompanyDetailsNotes extends StatelessWidget {
  const CompanyDetailsNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: const Border(
          left: BorderSide(
            color: AppColors.primaryContainer,
            width: 4.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.notes, color: AppColors.primaryContainer, size: AppSizes.iconS),
                    const SizedBox(width: AppSizes.s),
                    Text(
                      'Notes',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.edit_outlined, color: AppColors.textSecondary, size: AppSizes.iconS),
              ],
            ),
            const SizedBox(height: AppSizes.m),
            Text(
              'Key strategic partner since Q3 2024. Interested in expanding their cloud infrastructure and AI integration modules. Next check-in scheduled for next month.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textSlate700,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
