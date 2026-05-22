import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import 'package:nexus_crm/core/widgets/custom_logo.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LOGO
        Center(
          child: const CustomLogo(),
        ),

        const SizedBox(height: 24),

        /// TITLE
        const Center(
          child: Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Center(
          child: Text(
            'Login to manage your companies',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
