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
  Future<List<CompanyModel>> getRemoteCompanies({int page = 1}) async {
    final companies = await remoteDataSource.getCompanies(page: page);
    if (companies.isNotEmpty) {
      if (page == 1) {
        await localDataSource.cacheCompanies(companies);
      } else {
        final cached = await localDataSource.getCachedCompanies();
        final Map<int, CompanyModel> merged = {};
        for (var c in cached) {
          merged[c.id] = c;
        }
        for (var c in companies) {
          merged[c.id] = c;
        }
        await localDataSource.cacheCompanies(merged.values.toList());
      }
    }
    return companies;
  }
}
