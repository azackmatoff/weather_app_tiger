import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/home/repository/home_repository_impl.dart';
import 'package:weather_app/app/domain/home/repository/home_repository.dart';
import 'package:weather_app/app/presentation/home/flutter-way/set_state/business_logic/home_view_biz_logic_state.dart';

const _tag = 'HomeViewBizLogic';

class HomeViewBizLogic {
  final HomeRepository _repository = HomeRepositoryImpl();

  HomeViewBizLogicState state = const HomeViewBizLogicState(isLoading: true);

  Future<Position> _getCurrentPosition() async {
    try {
      final Position position = await _repository.getCurrentPosition();

      log('$_tag._getCurrentPosition, position.latitude ${position.latitude}');
      log('$_tag._getCurrentPosition, position.longitude ${position.longitude}');

      return position;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getWeatherByLocation(Function() setState) async {
    try {
      final position = await _getCurrentPosition();

      final weather = await _repository.getWeatherByLocation(
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );

      log('$_tag.getWeatherByLocation, weather $weather');
      state = state.copyWith(weather: weather, isLoading: false);

      log('$_tag.getWeatherByLocation, state.weather ${state.weather?.main.temp}');

      setState.call();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception(e);
    }
  }

  Future<void> getWeatherByCityName(String city, Function setState) async {
    state = state.copyWith(isLoading: true);
    setState.call();
    try {
      final weather = await _repository.getWeatherByCityName(city);

      log('$_tag.getWeatherByCityName, weather $weather');
      state = state.copyWith(weather: weather, isLoading: false);
      log('$_tag.getWeatherByCityName, state.weather ${state.weather?.main.temp}');
      setState.call();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      setState.call();
      throw Exception(e);
    }
  }
}
