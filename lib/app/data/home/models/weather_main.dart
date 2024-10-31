import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int seaLevel;
  @JsonKey(name: 'grnd_level')
  final int grndLevel;

  WeatherMain({
    required this.temp,
    this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) => _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
