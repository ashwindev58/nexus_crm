import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/tittle_widget.dart';
import '../../data/models/company_model.dart';
import '../widgets/company_details/company_details_header.dart';
import '../widgets/company_details/company_details_actions.dart';
import '../widgets/company_details/company_details_info_cards.dart';
import '../widgets/company_details/company_details_notes.dart';
import '../widgets/company_details/company_details_activity.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final CompanyModel company;

  const CompanyDetailsScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
        title: const TitleWidget(text: "Company Details"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF1E293B)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CompanyDetailsHeader(company: company),
              const SizedBox(height: 24),
              const CompanyDetailsActions(),
              const SizedBox(height: 32),
              CompanyDetailsInfoCards(company: company),
              const SizedBox(height: 16),
              const CompanyDetailsNotes(),
              const SizedBox(height: 28),
              const CompanyDetailsActivity(),
            ],
          ),
        ),
      ),
    );
  }
}
