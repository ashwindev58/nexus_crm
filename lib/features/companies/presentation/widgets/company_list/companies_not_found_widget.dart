import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

class CompaniesNotFoundWidget extends StatelessWidget {
  const CompaniesNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 80),
        Center(
          child: Text(
            'No companies found',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
