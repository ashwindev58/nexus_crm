part of 'companies_bloc.dart';

class CompaniesState {
  final bool isLoading;
  final List<CompanyModel> companies;
  final List<CompanyModel> filteredCompanies;
  final String statusFilter;
  final String searchQuery;
  final bool isOffline;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const CompaniesState({
    this.isLoading = true,
    this.companies = const [],
    this.filteredCompanies = const [],
    this.statusFilter = 'all',
    this.searchQuery = '',
    this.isOffline = false,
    this.currentPage = 1,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  CompaniesState copyWith({
    bool? isLoading,
    List<CompanyModel>? companies,
    List<CompanyModel>? filteredCompanies,
    String? statusFilter,
    String? searchQuery,
    bool? isOffline,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return CompaniesState(
      isLoading: isLoading ?? this.isLoading,
      companies: companies ?? this.companies,
      filteredCompanies: filteredCompanies ?? this.filteredCompanies,
      statusFilter: statusFilter ?? this.statusFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      isOffline: isOffline ?? this.isOffline,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
