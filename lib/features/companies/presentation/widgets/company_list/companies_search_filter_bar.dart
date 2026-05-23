import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import 'package:nexus_crm/core/localization/app_localizations.dart';
import '../../bloc/companies_bloc.dart';
import 'companies_segmented_control.dart';

class CompaniesSearchFilterBar extends StatefulWidget {
  const CompaniesSearchFilterBar({super.key});

  @override
  State<CompaniesSearchFilterBar> createState() => _CompaniesSearchFilterBarState();
}

class _CompaniesSearchFilterBarState extends State<CompaniesSearchFilterBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc, CompaniesState>(
      buildWhen: (previous, current) => previous.statusFilter != current.statusFilter,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              // Search Text Field
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (val) {
                    context.read<CompaniesBloc>().add(
                      SearchCompaniesEvent(val),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('searchCompanies'),
                    hintStyle: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Segmented Filter Control
              CompaniesSegmentedControl(
                selectedValue: state.statusFilter,
                onSelected: (status) {
                  context.read<CompaniesBloc>().add(
                    FilterCompaniesEvent(status),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
