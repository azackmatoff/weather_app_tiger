import 'package:weather_app/app/data/home/models/weather_response.dart';

class HomeViewBizLogicTwoState {
  final WeatherResponse? weather;
  final bool isLoading;

  const HomeViewBizLogicTwoState({
    this.weather,
    required this.isLoading,
  });

  HomeViewBizLogicTwoState copyWith({
    WeatherResponse? weather,
    bool? isLoading,
  }) {
    return HomeViewBizLogicTwoState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
