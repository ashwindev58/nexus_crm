import '../../domain/repositories/companies_repository.dart';
import '../datasources/companies_local_datasource.dart';
import '../datasources/companies_remote_datasource.dart';
import '../models/company_model.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final CompaniesRemoteDataSource remoteDataSource;
  final CompaniesLocalDataSource localDataSource;

  CompaniesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<CompanyModel>> getCachedCompanies() async {
    return localDataSource.getCachedCompanies();
  }

  @override
  Future<List<CompanyModel>> getRemoteCompanies() async {
    final companies = await remoteDataSource.getCompanies();
    if (companies.isNotEmpty) {
      await localDataSource.cacheCompanies(companies);
    }
    return companies;
  }
}
