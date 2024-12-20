import 'package:weather_app/app/data/home/models/weather_response.dart';

class HomeViewControllerState {
  final bool isLoading;
  final WeatherResponse? weather;
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
    WeatherResponse? weather,
    String? errorMessage,
  }) {
    return HomeViewControllerState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
