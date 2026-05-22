import 'package:flutter/material.dart';

import '../../../../../core/widgets/tittle_widget.dart';

class CompaniesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompaniesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F9FF),
      elevation: 0,
      centerTitle: false,
      title: const TitleWidget(text: 'Companies'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}