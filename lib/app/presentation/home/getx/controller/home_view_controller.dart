import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/home/repository/home_repository_impl.dart';
import 'package:weather_app/app/domain/home/repository/home_repository.dart';
import 'package:weather_app/app/presentation/home/getx/controller/home_view_controller_state.dart';

const _tag = 'HomeViewController';

class HomeViewController extends GetxController {
  final HomeRepository _repository = HomeRepositoryImpl();
  Rx<HomeViewControllerState> state = Rx(HomeViewControllerState.initial());

  @override
  void onInit() {
    super.onInit();
    state.value = state.value.copyWith(isLoading: true);
    _getWeatherByLocation();
  }

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

  Future<void> _getWeatherByLocation() async {
    try {
      final position = await _getCurrentPosition();

      final weather = await _repository.getWeatherByLocation(
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );

      log('$_tag.getWeatherByLocation, weather $weather');
      state.value = state.value.copyWith(weather: weather, isLoading: false);

      log('$_tag.getWeatherByLocation, state.weather ${state.value.weather?.main.temp}');
    } catch (e) {
      state.value = state.value.copyWith(
        isLoading: false,
        errorMessage: 'Something went wrong',
      );
      throw Exception(e);
    }
  }

  Future<void> getWeatherByCityName(String city) async {
    state.value = state.value.copyWith(isLoading: true);

    try {
      final weather = await _repository.getWeatherByCityName(city);

      log('$_tag.getWeatherByCityName, weather $weather');
      state.value = state.value.copyWith(weather: weather, isLoading: false);
      log('$_tag.getWeatherByCityName, state.weather ${state.value.weather?.main.temp}');
    } catch (e) {
      state.value = state.value.copyWith(
        isLoading: false,
        errorMessage: 'Something went wrong',
      );

      throw Exception(e);
    }
  }
}
