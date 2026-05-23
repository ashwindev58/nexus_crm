part of 'companies_bloc.dart';

abstract class CompaniesEvent {}

class LoadCompaniesEvent extends CompaniesEvent {}

class FilterCompaniesEvent extends CompaniesEvent {
  final String status;
  FilterCompaniesEvent(this.status);
}

class SearchCompaniesEvent extends CompaniesEvent {
  final String query;
  SearchCompaniesEvent(this.query);
}

class LoadMoreCompaniesEvent extends CompaniesEvent {}
