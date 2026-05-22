part of 'companies_bloc.dart';

class CompaniesState {
  final bool isLoading;
  final List<CompanyModel> companies;
  final List<CompanyModel> filteredCompanies;
  final String statusFilter;
  final String searchQuery;

  const CompaniesState({
    this.isLoading = false,
    this.companies = const [],
    this.filteredCompanies = const [],
    this.statusFilter = 'all',
    this.searchQuery = '',
  });

  CompaniesState copyWith({
    bool? isLoading,
    List<CompanyModel>? companies,
    List<CompanyModel>? filteredCompanies,
    String? statusFilter,
    String? searchQuery,
  }) {
    return CompaniesState(
      isLoading: isLoading ?? this.isLoading,
      companies: companies ?? this.companies,
      filteredCompanies: filteredCompanies ?? this.filteredCompanies,
      statusFilter: statusFilter ?? this.statusFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
