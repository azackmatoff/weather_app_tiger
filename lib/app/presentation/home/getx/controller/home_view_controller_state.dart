import 'package:weather_app/app/data/home/models/weather_model.dart';

class HomeViewControllerState {
  final bool isLoading;
  final WeatherModel? weather;
  final String errorMessage;

  HomeViewControllerState({
    required this.isLoading,
    required this.errorMessage,
    this.weather,
  });

  factory HomeViewControllerState.initial() {
    return HomeViewControllerState(
      isLoading: false,
      errorMessage: '',
      weather: null,
    );
  }

  HomeViewControllerState copyWith({
    bool? isLoading,
    WeatherModel? weather,
    String? errorMessage,
  }) {
    return HomeViewControllerState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
