
import 'package:flutter/material.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';

import '../../../data/models/company_model.dart';
import 'company_details_actions.dart';
import 'company_details_activity.dart';
import 'company_details_header.dart';
import 'company_details_info_cards.dart';
import 'company_details_notes.dart';


class TabStackLayoutWidget extends StatelessWidget {
  const TabStackLayoutWidget({
    super.key,
    required this.company,
  });

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.xxl,
        vertical: AppSizes.l,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                CompanyDetailsHeader(company: company),
                const SizedBox(height: AppSizes.xxl),
                const CompanyDetailsActions(),
                const SizedBox(height: AppSizes.xxxl),
                CompanyDetailsInfoCards(company: company),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.xxl),
          Expanded(
            flex: 4,
            child: Column(
              children: const [
                CompanyDetailsNotes(),
                SizedBox(height: AppSizes.xxl),
                CompanyDetailsActivity(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
