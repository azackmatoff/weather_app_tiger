import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/home/data_source/remote/remote_data_source.dart';
import 'package:weather_app/app/data/home/models/weather_response.dart';
import 'package:weather_app/app/domain/home/repository/home_repository.dart';
import 'package:weather_app/core/services/location_services.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource _remoteDataSource = RemoteDataSourceImpl();
  final LocationServices _locationServices = LocationServices();

  @override
  Future<Position> getCurrentPosition() {
    return _locationServices.getCurrentPosition();
  }

  @override
  Future<WeatherResponse> getWeatherByCityName(String city) {
    return _remoteDataSource.getWeatherByCityName(city);
  }

  @override
  Future<WeatherResponse> getWeatherByLocation({required String lat, required String lon}) {
    return _remoteDataSource.getWeatherByLocation(lat: lat, lon: lon);
  }
}
