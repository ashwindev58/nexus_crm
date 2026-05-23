import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants.dart';

class CompaniesNotFoundWidget extends StatelessWidget {
  const CompaniesNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.xl),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.business_center_outlined,
                size: AppSizes.avatarL / 2.0,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppSizes.xxl),
            Text(
              'No Companies Found',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: AppSizes.s),
            Text(
              'Try adjusting your search terms or segmented status filters to locate the company.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            const SizedBox(height: AppSizes.xxl),
            OutlinedButton.icon(
              onPressed: () {
                // Focus out and reset search controllers
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Clear Filters'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.xl,
                  vertical: AppSizes.m,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
