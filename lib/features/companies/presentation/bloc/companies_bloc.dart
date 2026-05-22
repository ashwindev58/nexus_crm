import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/company_model.dart';

part 'companies_event.dart';
part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  CompaniesBloc() : super(const CompaniesState()) {
    on<LoadCompaniesEvent>(_onLoadCompanies);
    on<FilterCompaniesEvent>(_onFilterCompanies);
    on<SearchCompaniesEvent>(_onSearchCompanies);
  }

  Future<void> _onLoadCompanies(
    LoadCompaniesEvent event,
    Emitter<CompaniesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Simulate API network latency
    await Future.delayed(const Duration(milliseconds: 800));

    final mockJson = [
      {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "contact@novadynamics.io",
        "address": {
          "street": "HQ",
          "suite": "Suite 100",
          "city": "San Francisco, CA",
          "zipcode": "94105",
          "geo": {"lat": "37.7749", "lng": "-122.4194"}
        },
        "phone": "+1 (555) 012-3456",
        "website": "novadynamics.io",
        "company": {
          "name": "Nova Dynamics",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        },
        "status": "active",
        "lastActive": "2h ago",
        "themeColor": 0xFF4F46E5,
        "teamAvatars": ["A", "B", "C"]
      },
      {
        "id": 2,
        "name": "Ervin Howell",
        "username": "Antonette",
        "email": "hello@solarislabs.co",
        "address": {
          "street": "R&D Center",
          "suite": "Suite 400",
          "city": "Austin, TX",
          "zipcode": "78701",
          "geo": {"lat": "30.2672", "lng": "-97.7431"}
        },
        "phone": "+1 (555) 987-6543",
        "website": "solarislabs.co",
        "company": {
          "name": "Solaris Labs",
          "catchPhrase": "Proactive didactic contingency",
          "bs": "synergize scalable e-commerce"
        },
        "status": "pending",
        "lastActive": "1d ago",
        "themeColor": 0xFFF59E0B, // Bright Amber
        "teamAvatars": ["X", "Y"]
      },
      {
        "id": 3,
        "name": "Clementine Bauch",
        "username": "Samantha",
        "email": "ops@ethereal.tech",
        "address": {
          "street": "Branch",
          "suite": "Suite 9",
          "city": "London, UK",
          "zipcode": "EC1A 1BB",
          "geo": {"lat": "51.5074", "lng": "-0.1278"}
        },
        "phone": "+44 20 7946 0958",
        "website": "ethereal.tech",
        "company": {
          "name": "Ethereal Tech",
          "catchPhrase": "Face to face bifurcated interface",
          "bs": "transition-cutting-edge solutions"
        },
        "status": "active",
        "lastActive": "5m ago",
        "themeColor": 0xFFC084FC, // Soft Purple
        "teamAvatars": ["J", "K", "L", "M"]
      },
      {
        "id": 4,
        "name": "Patricia Lebsack",
        "username": "Karianne",
        "email": "billing@quantum.com",
        "address": {
          "street": "Office",
          "suite": "Suite 42",
          "city": "Boston, MA",
          "zipcode": "02108",
          "geo": {"lat": "42.3601", "lng": "-71.0589"}
        },
        "phone": "+1 (555) 456-7890",
        "website": "quantum.com",
        "company": {
          "name": "Quantum Unit",
          "catchPhrase": "Multi-tiered zero tolerance productivity",
          "bs": "revolutionary web services"
        },
        "status": "inactive",
        "lastActive": "3d ago",
        "themeColor": 0xFF94A3B8, // Slate Grey
        "teamAvatars": ["P", "Q"]
      }
    ];

    final parsed = mockJson.map((x) => CompanyModel.fromJson(x)).toList();

    emit(state.copyWith(
      isLoading: false,
      companies: parsed,
      filteredCompanies: parsed,
      statusFilter: 'all',
      searchQuery: '',
    ));
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
