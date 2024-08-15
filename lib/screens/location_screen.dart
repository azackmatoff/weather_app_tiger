import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/location_services.dart';
import 'package:weather_app/services/network_services.dart';
import 'package:weather_app/utilities/app_text_style.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel? weatherModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getCurrentPosition();
  }

  Future<void> getWeatherByLocation(String lat, String lon) async {
    final WeatherModel weatherData = await networkServices.getWeatherByLocation(lat: '42.8667092', lon: '74.5814769');

    log('weatherData $weatherData');
    // log('weatherData ${weatherData['main']['temp']}');

    setState(() {
      // celcius = weatherData['main']['temp'];
      // celcius = weatherData.main.temp;
      // // description = weatherData['weather'][0]['description'];
      // description = weatherData.weather.first.description;

      weatherModel = weatherData;
      isLoading = false;
    });
  }

  Future<void> getWeatherByCityName(String city) async {
    final weatherData = await networkServices.getWeatherByCityName(cityName: city);

    log('weatherData $weatherData');
    // log('weatherData ${weatherData['main']['temp']}');

    setState(() {
      // celcius = weatherData.main.temp;
      // description = weatherData.weather.first.description;

      weatherModel = weatherData;
      isLoading = false;
    });
  }

  Future<void> getCurrentPosition() async {
    final Position position = await LocationServices.determinePosition();

    log('position.latitude ${position.latitude}');
    log('position.longitude ${position.longitude}');

    await getWeatherByLocation(position.latitude.toString(), position.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nature.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.near_me,
                              size: 50.0,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              String? kelgenShaarAty = await Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CityScreen();
                                },
                              ));

                              log('kelgenShaarAty $kelgenShaarAty');

                              if (kelgenShaarAty != null) {
                                setState(() {
                                  isLoading = true;
                                });
                                await getWeatherByCityName(kelgenShaarAty);
                              }
                            },
                            child: const Icon(
                              Icons.location_city,
                              size: 50.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //   'Hello 😊👋',
                      //   style: kButtonTextStyle,
                      // ),
                      // Text(
                      //   '\u{1F600}',
                      //   style: kButtonTextStyle,
                      // ), // grinning face emoji 😁

                      Row(
                        children: <Widget>[
                          Text(
                            '${weatherModel!.main.temp.toString()} °',
                            style: AppTextStyle.tempTextStyle,
                          ),
                          const Text(
                            '☀️',
                            style: AppTextStyle.conditionTextStyle,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          weatherModel!.weather.first.description,
                          textAlign: TextAlign.right,
                          style: AppTextStyle.messageTextStyle,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
