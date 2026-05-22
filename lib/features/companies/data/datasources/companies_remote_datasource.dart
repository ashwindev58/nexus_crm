import 'dart:convert';
import '../../../../core/network/api_client.dart';
import '../models/company_model.dart';

abstract class CompaniesRemoteDataSource {
  Future<List<CompanyModel>> getCompanies();
}

class CompaniesRemoteDataSourceImpl implements CompaniesRemoteDataSource {
  final ApiClient apiClient;

  CompaniesRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final response = await apiClient.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<CompanyModel> parsed = [];

      for (int i = 0; i < data.length; i++) {
        final item = Map<String, dynamic>.from(data[i]);

        // Dynamically enrich mock visual traits based on item index 
        // to replicate premium status pills, stacks, and branding badges
        if (i % 3 == 0) {
          item['status'] = 'active';
          item['lastActive'] = '${i + 2}h ago';
          item['themeColor'] = 0xFF4F46E5; // Royal Blue
          item['teamAvatars'] = ['A', 'B', 'C'];
        } else if (i % 3 == 1) {
          item['status'] = 'pending';
          item['lastActive'] = '${i + 1}d ago';
          item['themeColor'] = 0xFFF59E0B; // Soft Amber
          item['teamAvatars'] = ['X', 'Y'];
        } else {
          item['status'] = 'inactive';
          item['lastActive'] = '${i + 3}d ago';
          item['themeColor'] = 0xFF94A3B8; // Slate Grey
          item['teamAvatars'] = ['P', 'Q'];
        }

        parsed.add(CompanyModel.fromJson(item));
      }

      return parsed;
    } else {
      throw Exception('Failed to load companies from server');
    }
  }
}
