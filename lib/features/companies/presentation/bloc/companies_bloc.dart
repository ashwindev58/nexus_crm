import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/companies_repository.dart';
import '../../data/models/company_model.dart';

part 'companies_event.dart';
part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  final CompaniesRepository repository;

  CompaniesBloc({required this.repository}) : super(const CompaniesState()) {
    on<LoadCompaniesEvent>(_onLoadCompanies);
    on<FilterCompaniesEvent>(_onFilterCompanies);
    on<SearchCompaniesEvent>(_onSearchCompanies);
    on<LoadMoreCompaniesEvent>(_onLoadMoreCompanies);
  }

  List<CompanyModel> _filterList(
    List<CompanyModel> list,
    String statusFilter,
    String searchQuery,
  ) {
    final status = statusFilter.toLowerCase();
    final query = searchQuery.toLowerCase();

    return list.where((c) {
      final matchesStatus = status == 'all' || c.status.toLowerCase() == status;
      final matchesSearch = c.company.name.toLowerCase().contains(query) ||
          c.name.toLowerCase().contains(query) ||
          c.username.toLowerCase().contains(query) ||
          c.email.toLowerCase().contains(query);
      return matchesStatus && matchesSearch;
    }).toList();
  }

  Future<void> _onLoadCompanies(
    LoadCompaniesEvent event,
    Emitter<CompaniesState> emit,
  ) async {
    final cached = await repository.getCachedCompanies();

    if (cached.isNotEmpty) {
      emit(state.copyWith(
        isLoading: false,
        isOffline: true,
        companies: cached,
        filteredCompanies: _filterList(cached, state.statusFilter, state.searchQuery),
        currentPage: 1,
        hasMore: true,
        isLoadingMore: false,
      ));
    } else {
      emit(state.copyWith(
        isLoading: true,
        currentPage: 1,
        hasMore: true,
        isLoadingMore: false,
      ));
    }

    try {
      final parsed = await repository.getRemoteCompanies(page: 1);

      emit(state.copyWith(
        isLoading: false,
        isOffline: false,
        companies: parsed,
        filteredCompanies: _filterList(parsed, state.statusFilter, state.searchQuery),
        currentPage: 1,
        hasMore: true,
        isLoadingMore: false,
      ));
    } catch (_) {
      if (state.companies.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          isOffline: true,
          companies: [],
          filteredCompanies: [],
          currentPage: 1,
          hasMore: false,
          isLoadingMore: false,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isOffline: true,
          isLoadingMore: false,
        ));
      }
    }
  }

  Future<void> _onLoadMoreCompanies(
    LoadMoreCompaniesEvent event,
    Emitter<CompaniesState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;
      final parsed = await repository.getRemoteCompanies(page: nextPage);

      if (parsed.isEmpty) {
        emit(state.copyWith(
          isLoadingMore: false,
          hasMore: false,
        ));
      } else {
        final updatedCompanies = List<CompanyModel>.from(state.companies)..addAll(parsed);
        emit(state.copyWith(
          isLoadingMore: false,
          currentPage: nextPage,
          companies: updatedCompanies,
          filteredCompanies: _filterList(updatedCompanies, state.statusFilter, state.searchQuery),
          hasMore: nextPage < 4, // Limit mock pagination to 4 pages (40 items total)
        ));
      }
    } catch (_) {
      emit(state.copyWith(
        isLoadingMore: false,
        isOffline: true,
      ));
    }
  }

  void _onFilterCompanies(
    FilterCompaniesEvent event,
    Emitter<CompaniesState> emit,
  ) {
    final status = event.status.toLowerCase();
    final query = state.searchQuery.toLowerCase();

    final filtered = state.companies.where((c) {
      final matchesStatus = status == 'all' || c.status.toLowerCase() == status;
      final matchesSearch = c.company.name.toLowerCase().contains(query) ||
          c.name.toLowerCase().contains(query) ||
          c.username.toLowerCase().contains(query) ||
          c.email.toLowerCase().contains(query);
      return matchesStatus && matchesSearch;
    }).toList();

    emit(state.copyWith(
      statusFilter: event.status,
      filteredCompanies: filtered,
    ));
  }

  void _onSearchCompanies(
    SearchCompaniesEvent event,
    Emitter<CompaniesState> emit,
  ) {
    final query = event.query.toLowerCase();
    final status = state.statusFilter.toLowerCase();

    final filtered = state.companies.where((c) {
      final matchesStatus = status == 'all' || c.status.toLowerCase() == status;
      final matchesSearch = c.company.name.toLowerCase().contains(query) ||
          c.name.toLowerCase().contains(query) ||
          c.username.toLowerCase().contains(query) ||
          c.email.toLowerCase().contains(query);
      return matchesStatus && matchesSearch;
    }).toList();

    emit(state.copyWith(
      searchQuery: event.query,
      filteredCompanies: filtered,
    ));
  }
}
