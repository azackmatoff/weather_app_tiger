import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utilities/app_constants.dart';
import 'package:http/http.dart' as http;

class NetworkServices {
  http.Client client = http.Client();

  Future<WeatherModel> getWeatherByLocation({
    required String lat,
    required String lon,
  }) async {
    try {
      final url = '${AppConstants.apiBaseUrl}?lat=$lat&lon=$lon&units=metric&appid=${AppConstants.apiKey}';
      Uri uri = Uri.parse(url);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return WeatherModel.fromMap(data);
      } else {
        throw Exception('response.statusCode: ${response.statusCode}, response.body: ${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<WeatherModel> getWeatherByCityName({
    required String cityName,
  }) async {
    try {
      final url = '${AppConstants.apiBaseUrl}?q=$cityName&units=metric&appid=${AppConstants.apiKey}';
      Uri uri = Uri.parse(url);
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return WeatherModel.fromMap(data);
      } else {
        throw Exception('response.statusCode: ${response.statusCode}, response.body: ${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final NetworkServices networkServices = NetworkServices();
