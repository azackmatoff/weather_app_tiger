import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/data/home/repository/home_repository_impl.dart';
import 'package:weather_app/app/domain/home/repository/home_repository.dart';
import 'package:weather_app/app/presentation/home/flutter-way/no_set_state/buisness_logic/home_view_biz_logic_two_state.dart';

const _tag = 'HomeViewBizLogicTwo';

class HomeViewBizLogicTwo {
  final HomeRepository _repository = HomeRepositoryImpl();

  ValueNotifier<String> valueNotifier = ValueNotifier('Azamat');

  ValueNotifier<HomeViewBizLogicTwoState> state = ValueNotifier(
    const HomeViewBizLogicTwoState(isLoading: true),
  );

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

  Future<void> getWeatherByLocation() async {
    try {
      final position = await _getCurrentPosition();

      final weather = await _repository.getWeatherByLocation(
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );

      log('$_tag.getWeatherByLocation, weather $weather');
      state.value = state.value.copyWith(weather: weather, isLoading: false);

      log('$_tag.getWeatherByLocation, state.value.weather ${state.value.weather?.main.temp}');
    } catch (e) {
      state.value = state.value.copyWith(isLoading: false);
      throw Exception(e);
    }
  }

  Future<void> getWeatherByCityName(String city) async {
    state.value = state.value.copyWith(isLoading: true);

    try {
      final weather = await _repository.getWeatherByCityName(city);

      log('$_tag.getWeatherByCityName, weather $weather');
      state.value = state.value.copyWith(weather: weather, isLoading: false);
      log('$_tag.getWeatherByCityName, state.value.weather ${state.value.weather?.main.temp}');
    } catch (e) {
      state.value = state.value.copyWith(isLoading: false);

      throw Exception(e);
    }
  }
}
