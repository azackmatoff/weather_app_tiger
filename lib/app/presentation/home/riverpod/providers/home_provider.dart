import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/data/home/repository/home_repository_impl.dart';
import 'package:weather_app/app/domain/home/repository/home_repository.dart';
import 'package:weather_app/app/presentation/home/riverpod/providers/home_provider_state.dart';

const _tag = 'HomeNotifier';

class HomeNotifier extends StateNotifier<HomeProviderState> {
  final HomeRepository _repository = HomeRepositoryImpl();
  HomeNotifier() : super(HomeProviderState.initial()) {
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
      state = state.copyWith(weather: weather, isLoading: false);

      log('$_tag.getWeatherByLocation, state.weather ${state.weather?.main.temp}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Something went wrong',
      );
      throw Exception(e);
    }
  }

  Future<void> getWeatherByCityName(String city) async {
    state = state.copyWith(isLoading: true);

    try {
      final weather = await _repository.getWeatherByCityName(city);

      log('$_tag.getWeatherByCityName, weather $weather');
      state = state.copyWith(weather: weather, isLoading: false);
      log('$_tag.getWeatherByCityName, state.weather ${state.weather?.main.temp}');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Something went wrong',
      );

      throw Exception(e);
    }
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeProviderState>((ref) {
  return HomeNotifier();
});
