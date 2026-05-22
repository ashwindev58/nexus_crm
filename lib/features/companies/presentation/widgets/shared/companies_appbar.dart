import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../../../core/widgets/tittle_widget.dart';

class CompaniesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompaniesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      title: const TitleWidget(text: 'Companies'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}