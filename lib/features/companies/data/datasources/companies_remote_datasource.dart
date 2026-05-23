import 'dart:convert';
import '../../../../core/network/api_client.dart';
import '../models/company_model.dart';

abstract class CompaniesRemoteDataSource {
  Future<List<CompanyModel>> getCompanies({int page = 1, int limit = 10});
}

class CompaniesRemoteDataSourceImpl implements CompaniesRemoteDataSource {
  final ApiClient apiClient;

  CompaniesRemoteDataSourceImpl({required this.apiClient});

  // Mock corporate names for paginated pages to look premium and authentic
  static const Map<int, List<String>> _pageNames = {
    2: [
      'Acme Corp', 'Apex Industries', 'Vector Media', 'Nebula Soft', 'Nova Retail',
      'Ember Logistics', 'Zenith Design', 'Aura Labs', 'Summit Tech', 'Quantum Labs'
    ],
    3: [
      'Titan Solutions', 'Prism Digital', 'Eclipse Ventures', 'Horizon Capital',
      'Polaris Global', 'Vanguard Media', 'Matrix Corp', 'Pinnacle Group', 'Solstice Inc', 'Apex Dynamics'
    ],
    4: [
      'Helix Systems', 'Infinity Brands', 'Enigma Holdings', 'Sovereign Tech',
      'Catalyst Creative', 'Momentum Logistics', 'Chronos Media', 'Atlas Ventures', 'Terra Energy', 'Pioneer Soft'
    ],
  };

  @override
  Future<List<CompanyModel>> getCompanies({int page = 1, int limit = 10}) async {
    final response = await apiClient.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<CompanyModel> parsed = [];

      for (int i = 0; i < data.length; i++) {
        final item = Map<String, dynamic>.from(data[i]);
        final originalId = item['id'] as int;
        
        // Mutate ID and names for subsequent pages
        if (page > 1) {
          final newId = (page - 1) * 10 + originalId;
          item['id'] = newId;
          
          final pageNameList = _pageNames[page] ?? _pageNames[2]!;
          final mockCompanyName = pageNameList[i % pageNameList.length];
          item['name'] = '$mockCompanyName CEO';
          item['username'] = '${mockCompanyName.replaceAll(' ', '').toLowerCase()}_admin';
          item['email'] = 'contact@${mockCompanyName.replaceAll(' ', '').toLowerCase()}.com';
          
          if (item['company'] != null) {
            final comp = Map<String, dynamic>.from(item['company']);
            comp['name'] = mockCompanyName;
            comp['catchPhrase'] = 'Leading the way in $mockCompanyName domain solutions.';
            item['company'] = comp;
          }
        }

        // Dynamically enrich mock visual traits based on item ID
        final finalId = item['id'] as int;
        if (finalId % 3 == 0) {
          item['status'] = 'active';
          item['lastActive'] = '${(finalId % 10) + 1}h ago';
          item['themeColor'] = 0xFF4F46E5; // Royal Blue
          item['teamAvatars'] = ['A', 'B', 'C'];
        } else if (finalId % 3 == 1) {
          item['status'] = 'pending';
          item['lastActive'] = '${(finalId % 7) + 1}d ago';
          item['themeColor'] = 0xFFF59E0B; // Soft Amber
          item['teamAvatars'] = ['X', 'Y'];
        } else {
          item['status'] = 'inactive';
          item['lastActive'] = '${(finalId % 14) + 1}d ago';
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
