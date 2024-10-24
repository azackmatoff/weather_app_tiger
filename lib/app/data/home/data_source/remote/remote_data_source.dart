import 'dart:developer';

import 'package:weather_app/app/data/home/models/weather_model.dart';
import 'package:weather_app/core/services/api/api_services.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getWeatherByCityName(String city);
  Future<WeatherModel> getWeatherByLocation({required String lat, required String lon});
}

const _tag = 'RemoteDataSourceImpl';

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiServices _apiServices = ApiServices();

  @override
  Future<WeatherModel> getWeatherByCityName(String city) async {
    log('$_tag.getWeatherByCityName, city $city');
    //   final url = '${ApiConstants.apiBaseUrl}?q=$cityName&units=metric&appid=${ApiConstants.apiKey}';

    try {
      final endpoint = '?q=$city&units=metric';
      final data = await _apiServices.get(endpoint);
      log('$_tag.getWeatherByCityName, data $data');
      return WeatherModel.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeatherModel> getWeatherByLocation({required String lat, required String lon}) {
    log('$_tag.getWeatherByLocation, lat $lat, lon $lon');
    try {
      final endpoint = '?lat=$lat&lon=$lon&units=metric';
      return _apiServices.get(endpoint).then((data) => WeatherModel.fromMap(data));
    } catch (e) {
      rethrow;
    }
  }
}
