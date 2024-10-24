import 'package:weather_app/app/data/home/models/weather_model.dart';

class HomeViewBizLogicState {
  final WeatherModel? weather;
  final bool isLoading;

  const HomeViewBizLogicState({
    this.weather,
    required this.isLoading,
  });

  HomeViewBizLogicState copyWith({
    WeatherModel? weather,
    bool? isLoading,
  }) {
    return HomeViewBizLogicState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
