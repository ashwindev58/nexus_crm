import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_crm/core/theme/app_theme.dart';
import '../bloc/companies_bloc.dart';
import '../widgets/shared/companies_appbar.dart';
import '../widgets/company_list/companies_segmented_control.dart';
import 'company_dynamic_list_view.dart';

class CompanyListScreen extends StatefulWidget {
  const CompanyListScreen({super.key});

  @override
  State<CompanyListScreen> createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CompaniesAppBar(),
      body: BlocBuilder<CompaniesBloc, CompaniesState>(
        builder: (context, state) {
          return Column(
            children: [
              // Search Bar & Filter Tabs Area
              Padding(
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
                        decoration: const InputDecoration(
                          hintText: 'Search companies...',
                          hintStyle: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
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
              ),

              // Offline Indicator banner
              if (state.isOffline)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLightIndigo, // soft slate/light indigo background
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderLightLavender, // soft lavender/indigo border
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.cloud_off_rounded,
                        color: AppColors.primaryContainer, // Indigo icon
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'You are viewing offline cached data.',
                          style: TextStyle(
                            color: AppColors.textDarkIndigo, // dark indigo text
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Dynamic List View
              const CompanyDynamicListView(),
            ],
          );
        },
      ),
    );
  }
}
