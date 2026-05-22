import 'dart:async';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: headers,
      ).timeout(const Duration(seconds: 8));
      return response;
    } on TimeoutException {
      throw Exception('Network connection timed out');
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
