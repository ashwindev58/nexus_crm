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
    // 1. Try to load cached companies first to render instantly
    final cached = await repository.getCachedCompanies();

    if (cached.isNotEmpty) {
      emit(state.copyWith(
        isLoading: false,
        isOffline: true, // Mark as offline/cache view until fresh network load completes
        companies: cached,
        filteredCompanies: _filterList(cached, state.statusFilter, state.searchQuery),
      ));
    } else {
      emit(state.copyWith(isLoading: true));
    }

    try {
      final parsed = await repository.getRemoteCompanies();

      emit(state.copyWith(
        isLoading: false,
        isOffline: false, // Network succeeded, we are fully online
        companies: parsed,
        filteredCompanies: _filterList(parsed, state.statusFilter, state.searchQuery),
      ));
    } catch (_) {
      // Timeout, socket exception (completely offline), etc.
      if (state.companies.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          isOffline: true,
          companies: [],
          filteredCompanies: [],
        ));
      } else {
        // Retain current companies (loaded from cache) and keep isOffline = true
        emit(state.copyWith(
          isLoading: false,
          isOffline: true,
        ));
      }
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
