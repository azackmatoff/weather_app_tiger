import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/common/constants/api_constants.dart';

class ApiServices {
  http.Client client = http.Client();

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      Uri uri = Uri.parse('${ApiConstants.apiBaseUrl}$endpoint&appid=${ApiConstants.apiKey}');

      http.Response response = await client.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        return data;
      } else {
        // More specific exception with status code
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Include both the original exception and potential decoding issues
      throw Exception('Error fetching crypto prices: $e.');
    }
  }

  Future<void> post() async {
    // API call
  }

  Future<void> put() async {
    // API call
  }

  Future<void> delete() async {
    // API call
  }
}
// CRUD - Create Read Update Delete