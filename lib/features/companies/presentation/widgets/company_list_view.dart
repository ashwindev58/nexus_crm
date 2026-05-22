import 'package:flutter/material.dart';
import '../../data/models/company_model.dart';
import 'company_card.dart';

class CompanyListView extends StatelessWidget {
  final List<CompanyModel> companies;

  const CompanyListView({
    super.key,
    required this.companies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: companies.length,
      itemBuilder: (context, index) {
        final company = companies[index];
        return CompanyCard(
          company: company,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected company: ${company.company.name}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );
  }
}
