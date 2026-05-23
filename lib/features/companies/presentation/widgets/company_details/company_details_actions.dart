import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../../../core/constants/app_constants.dart';

class CompanyDetailsActions extends StatelessWidget {
  const CompanyDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildQuickAction(context, Icons.phone, 'Call', () {}),
        const SizedBox(width: AppSizes.xxl),
        _buildQuickAction(context, Icons.email, 'Email', () {}),
        const SizedBox(width: AppSizes.xxl),
        _buildQuickAction(context, Icons.chat_bubble, 'Message', () {}),
      ],
    );
  }

  Widget _buildQuickAction(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(100),
            child: Ink(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: AppSizes.iconL - 2.0),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.s),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
