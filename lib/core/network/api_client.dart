import 'dart:async';
import 'package:http/http.dart' as http;
import '../config/env_config.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    try {
      String resolvedUrl = url;
      if (url.startsWith('https://jsonplaceholder.typicode.com')) {
        resolvedUrl = url.replaceAll(
          'https://jsonplaceholder.typicode.com',
          EnvConfig.instance.apiBaseUrl,
        );
      } else if (!url.startsWith('http://') && !url.startsWith('https://')) {
        final base = EnvConfig.instance.apiBaseUrl;
        final separator = (base.endsWith('/') || url.startsWith('/')) ? '' : '/';
        resolvedUrl = '$base$separator$url';
      }

      final response = await _client.get(
        Uri.parse(resolvedUrl),
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
