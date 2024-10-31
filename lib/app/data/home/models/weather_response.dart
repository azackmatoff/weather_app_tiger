import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/app/data/home/models/clouds.dart';
import 'package:weather_app/app/data/home/models/coord.dart';
import 'package:weather_app/app/data/home/models/sys.dart';
import 'package:weather_app/app/data/home/models/weather.dart';
import 'package:weather_app/app/data/home/models/weather_main.dart';
import 'package:weather_app/app/data/home/models/wind.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final WeatherMain main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
