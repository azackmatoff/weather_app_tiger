import 'package:weather_app/app/data/home/models/weather_response.dart';

class HomeViewBizLogicState {
  final WeatherResponse? weather;
  final bool isLoading;

  const HomeViewBizLogicState({
    this.weather,
    required this.isLoading,
  });

  HomeViewBizLogicState copyWith({
    WeatherResponse? weather,
    bool? isLoading,
  }) {
    return HomeViewBizLogicState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
