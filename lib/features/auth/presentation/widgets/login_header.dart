import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import 'package:nexus_crm/core/widgets/custom_logo.dart';
import 'package:nexus_crm/core/localization/app_localizations.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LOGO
        Center(
          child: const CustomLogo(),
        ),

        const SizedBox(height: 24),

        /// TITLE
        Center(
          child: Text(
            localizations.translate('signIn'),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Center(
          child: Text(
            localizations.translate('enterCredentials'),
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
