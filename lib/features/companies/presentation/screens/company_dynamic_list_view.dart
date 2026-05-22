import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/companies_bloc.dart';
import '../widgets/company_list/companies_not_found_widget.dart';
import '../widgets/company_list/company_list_view.dart';
import '../widgets/company_list/company_card_skeleton.dart';

class CompanyDynamicListView extends StatelessWidget {
  const CompanyDynamicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc, CompaniesState>(
      builder: (context, state) {
        return Expanded(
          child: state.isLoading
              ? const CompanyListSkeleton()
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<CompaniesBloc>().add(
                          LoadCompaniesEvent(),
                        );
                  },
                  color: const Color(0xFF4F46E5),
                  child: state.filteredCompanies.isEmpty
                      ? const CompaniesNotFoundWidget()
                      : CompanyListView(
                          companies: state.filteredCompanies,
                        ),
                ),
        );
      },
    );
  }
}
