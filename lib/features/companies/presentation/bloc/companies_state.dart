part of 'companies_bloc.dart';

class CompaniesState {
  final bool isLoading;
  final List<CompanyModel> companies;
  final List<CompanyModel> filteredCompanies;
  final String statusFilter;
  final String searchQuery;
  final bool isOffline;

  const CompaniesState({
    this.isLoading = false,
    this.companies = const [],
    this.filteredCompanies = const [],
    this.statusFilter = 'all',
    this.searchQuery = '',
    this.isOffline = false,
  });

  CompaniesState copyWith({
    bool? isLoading,
    List<CompanyModel>? companies,
    List<CompanyModel>? filteredCompanies,
    String? statusFilter,
    String? searchQuery,
    bool? isOffline,
  }) {
    return CompaniesState(
      isLoading: isLoading ?? this.isLoading,
      companies: companies ?? this.companies,
      filteredCompanies: filteredCompanies ?? this.filteredCompanies,
      statusFilter: statusFilter ?? this.statusFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
