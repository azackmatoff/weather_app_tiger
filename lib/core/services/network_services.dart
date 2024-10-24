import 'dart:convert';

import 'package:weather_app/app/data/home/models/weather_model.dart';
import 'package:weather_app/common/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class NetworkServices {
  http.Client client = http.Client();

  Future<WeatherModel> getWeatherByLocation({
    required String lat,
    required String lon,
  }) async {
    try {
      final url = '${ApiConstants.apiBaseUrl}?lat=$lat&lon=$lon&units=metric&appid=${ApiConstants.apiKey}';
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
      final url = '${ApiConstants.apiBaseUrl}?q=$cityName&units=metric&appid=${ApiConstants.apiKey}';
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
