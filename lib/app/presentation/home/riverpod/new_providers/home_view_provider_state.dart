import 'package:weather_app/app/data/home/models/weather_response.dart';

class HomeViewProviderState {
  final bool isLoading;
  final WeatherResponse? weather;
  final String errorMessage;

  HomeViewProviderState({
    required this.isLoading,
    required this.errorMessage,
    this.weather,
  });

  factory HomeViewProviderState.initial() {
    return HomeViewProviderState(
      isLoading: true,
      errorMessage: '',
      weather: null,
    );
  }

  HomeViewProviderState copyWith({
    bool? isLoading,
    WeatherResponse? weather,
    String? errorMessage,
  }) {
    return HomeViewProviderState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
