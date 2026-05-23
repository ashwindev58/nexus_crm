import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Aura CRM",
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: AppColors.primary, // Violet blue color matching mockup
      ),
    );
  }
}