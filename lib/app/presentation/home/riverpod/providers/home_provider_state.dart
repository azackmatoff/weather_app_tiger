import 'package:weather_app/app/data/home/models/weather_response.dart';

class HomeProviderState {
  final bool isLoading;
  final WeatherResponse? weather;
  final String errorMessage;

  HomeProviderState({
    required this.isLoading,
    required this.errorMessage,
    this.weather,
  });

  factory HomeProviderState.initial() {
    return HomeProviderState(
      isLoading: true,
      errorMessage: '',
      weather: null,
    );
  }

  HomeProviderState copyWith({
    bool? isLoading,
    WeatherResponse? weather,
    String? errorMessage,
  }) {
    return HomeProviderState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
