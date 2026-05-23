import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../widgets/shared/companies_appbar.dart';
import '../widgets/company_list/companies_search_filter_bar.dart';
import '../widgets/company_list/companies_offline_banner.dart';
import 'company_dynamic_list_view.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: CompaniesAppBar(),
      body: Column(
        children: [
          CompaniesSearchFilterBar(),
          CompaniesOfflineBanner(),
          CompanyDynamicListView(),
        ],
      ),
    );
  }
}
