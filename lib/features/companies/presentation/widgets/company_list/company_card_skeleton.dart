import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../../../../../core/widgets/shimmer_effect.dart';

class CompanyCardSkeleton extends StatelessWidget {
  const CompanyCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.divider, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar skeleton
                const ShimmerEffect.circular(width: 44, height: 44),
                const SizedBox(width: 14),
                // Header skeleton
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          ShimmerEffect.rectangular(width: 120, height: 16),
                          SizedBox(width: 8),
                          ShimmerEffect.rectangular(width: 50, height: 12),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const ShimmerEffect.rectangular(width: 160, height: 12),
                      const SizedBox(height: 6),
                      const ShimmerEffect.rectangular(width: 140, height: 10),
                    ],
                  ),
                ),
                const ShimmerEffect.rectangular(width: 16, height: 16),
              ],
            ),
            const Divider(color: AppColors.divider, height: 24, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Metadata skeleton
                const ShimmerEffect.rectangular(width: 140, height: 12),
                // Team avatars skeleton
                Row(
                  children: const [
                    ShimmerEffect.circular(width: 24, height: 24),
                    SizedBox(width: 4),
                    ShimmerEffect.circular(width: 24, height: 24),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyListSkeleton extends StatelessWidget {
  const CompanyListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const CompanyCardSkeleton();
      },
    );
  }
}
