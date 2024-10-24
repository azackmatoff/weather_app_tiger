import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/home/models/weather_model.dart';

abstract class HomeRepository {
  Future<Position> getCurrentPosition();
  Future<WeatherModel> getWeatherByLocation({required String lat, required String lon});
  Future<WeatherModel> getWeatherByCityName(String city);
}
