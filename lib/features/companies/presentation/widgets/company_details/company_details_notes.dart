import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

class CompanyDetailsNotes extends StatelessWidget {
  const CompanyDetailsNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Container(
            width: 4,
            height: 140,
            color: AppColors.primaryContainer,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.notes, color: AppColors.primaryContainer, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Notes',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.edit_outlined, color: AppColors.textSecondary, size: 18),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Key strategic partner since Q3 2024. Interested in expanding their cloud infrastructure and AI integration modules. Next check-in scheduled for next month.',
                    style: TextStyle(
                      color: AppColors.textSlate700,
                      fontSize: 13,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
