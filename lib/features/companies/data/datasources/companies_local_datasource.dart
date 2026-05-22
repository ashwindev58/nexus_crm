import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/company_model.dart';

abstract class CompaniesLocalDataSource {
  Future<void> cacheCompanies(List<CompanyModel> companies);
  Future<List<CompanyModel>> getCachedCompanies();
}

class CompaniesLocalDataSourceImpl implements CompaniesLocalDataSource {
  SharedPreferences? _sharedPreferences;
  static const _cacheKey = 'CACHED_COMPANIES';

  Future<SharedPreferences> _getDb() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  @override
  Future<void> cacheCompanies(List<CompanyModel> companies) async {
    try {
      final db = await _getDb();
      final List<Map<String, dynamic>> jsonList =
          companies.map((c) => c.toJson()).toList();
      final String jsonString = jsonEncode(jsonList);
      await db.setString(_cacheKey, jsonString);
    } catch (_) {
      // Safe fallback
    }
  }

  @override
  Future<List<CompanyModel>> getCachedCompanies() async {
    try {
      final db = await _getDb();
      final jsonString = db.getString(_cacheKey);
      if (jsonString != null) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        return decoded
            .map((item) => CompanyModel.fromJson(Map<String, dynamic>.from(item)))
            .toList();
      }
    } catch (_) {
      // Safe fallback
    }
    return [];
  }
}
