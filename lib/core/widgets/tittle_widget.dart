import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.primary, // Violet blue color matching mockup
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 0.3,
        height: 1.4,
      ),
    );
  }
}
