
import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../data/models/company_model.dart';
import '../shared/company_status_badge.dart';

class CompanyCardHeader extends StatelessWidget {
  const CompanyCardHeader({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  company.company.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDarkNearBlack,
                      ),
                ),
              ),
              const SizedBox(width: AppSizes.s),
              CompanyStatusBadge(status: company.status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            company.email,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            company.phone,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
