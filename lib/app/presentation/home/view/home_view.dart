import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:weather_app/app/presentation/city/view/city_view.dart';
import 'package:weather_app/app/presentation/home/business_logic/home_view_biz_logic.dart';
import 'package:weather_app/common/constants/app_text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _bizLogic = HomeViewBizLogic();

  @override
  void initState() {
    super.initState();

    _bizLogic.getWeatherByLocation(
      () => setState(() {}),
    );
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
            child: _bizLogic.state.isLoading
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
                              String? city = await Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const CityView();
                                },
                              ));

                              log('city $city');

                              if (city != null) {
                                _bizLogic.getWeatherByCityName(
                                  city,
                                  () => setState(() {}),
                                );
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
                            '${_bizLogic.state.weather?.main.temp.toString()} °',
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
                          _bizLogic.state.weather?.weather.first.description ?? '',
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
