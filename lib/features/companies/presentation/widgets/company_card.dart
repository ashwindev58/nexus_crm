import 'package:flutter/material.dart';
import 'package:nexus_crm/features/companies/presentation/widgets/company_meta_data.dart';
import '../../data/models/company_model.dart';
import 'comapny_card_header.dart';
import 'company_avatar.dart';
import 'company_team_stack.dart';

class CompanyCard extends StatelessWidget {
  final CompanyModel company;
  final VoidCallback? onTap;

  const CompanyCard({super.key, required this.company, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade100, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CompanyAvatar(company: company),
                  const SizedBox(width: 14),
                  ComanyCardHeader(company: company),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF94A3B8),
                    size: 20,
                  ),
                ],
              ),
              Divider(color: Colors.grey.shade100, height: 24, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CompanyMetaData(company: company),
                  CompanyTeamStack(
                    teamAvatars: company.teamAvatars,
                    status: company.status,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
