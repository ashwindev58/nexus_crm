import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../../../core/widgets/tittle_widget.dart';
import '../../../../../core/widgets/env_badge.dart';
import '../../../../../core/widgets/language_selector.dart';
import '../../../../../core/localization/app_localizations.dart';

class CompaniesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompaniesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          TitleWidget(text: localizations.translate('companies')),
          const EnvBadge(),
        ],
      ),
      actions: [
        const LanguageSelector(),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}