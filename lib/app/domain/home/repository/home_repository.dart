import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/home/models/weather_response.dart';

abstract class HomeRepository {
  Future<Position> getCurrentPosition();
  Future<WeatherResponse> getWeatherByLocation({required String lat, required String lon});
  Future<WeatherResponse> getWeatherByCityName(String city);
}
