import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../data/models/company_model.dart';
import 'company_details_actions.dart';
import 'company_details_activity.dart';
import 'company_details_header.dart';
import 'company_details_info_cards.dart';
import 'company_details_notes.dart';

class MobileStackLayOut extends StatelessWidget {
  const MobileStackLayOut({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompanyDetailsHeader(company: company),
            const SizedBox(height: AppSizes.xxl),
            const CompanyDetailsActions(),
            const SizedBox(height: AppSizes.xxxl),
            CompanyDetailsInfoCards(company: company),
            const SizedBox(height: AppSizes.l),
            const CompanyDetailsNotes(),
            const SizedBox(height: AppSizes.xxl),
            const CompanyDetailsActivity(),
          ],
        ),
      ),
    );
  }
}
