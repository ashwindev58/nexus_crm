import '../../data/models/company_model.dart';

abstract class CompaniesRepository {
  Future<List<CompanyModel>> getCachedCompanies();
  Future<List<CompanyModel>> getRemoteCompanies();
}
