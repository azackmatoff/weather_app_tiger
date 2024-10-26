import 'package:weather_app/app/data/home/models/weather_model.dart';

class HomeViewBizLogicTwoState {
  final WeatherModel? weather;
  final bool isLoading;

  const HomeViewBizLogicTwoState({
    this.weather,
    required this.isLoading,
  });

  HomeViewBizLogicTwoState copyWith({
    WeatherModel? weather,
    bool? isLoading,
  }) {
    return HomeViewBizLogicTwoState(
      weather: weather ?? this.weather,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
