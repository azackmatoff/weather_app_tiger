import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/app/presentation/city/view/city_view.dart';
import 'package:weather_app/app/presentation/home/getx/controller/home_view_controller.dart';
import 'package:weather_app/common/constants/app_text_style.dart';

class GetxHomeView extends StatefulWidget {
  const GetxHomeView({super.key});

  @override
  _GetxHomeViewState createState() => _GetxHomeViewState();
}

class _GetxHomeViewState extends State<GetxHomeView> {
  final HomeViewController _controller = Get.put(HomeViewController());

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
            child: Obx(() {
              return _controller.state.value.isLoading ? _loader() : _content(context);
            }),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
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
                  _controller.getWeatherByCityName(city);
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
        Row(
          children: <Widget>[
            Obx(() => Text(
                  '${_controller.state.value.weather?.main.temp.toString()} °',
                  style: AppTextStyle.tempTextStyle,
                )),
            const Text(
              '☀️',
              style: AppTextStyle.conditionTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Obx(() => Text(
                _controller.state.value.weather?.weather.first.description ?? '',
                textAlign: TextAlign.right,
                style: AppTextStyle.messageTextStyle,
              )),
        ),
      ],
    );
  }

  Widget _loader() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.white,
    ));
  }
}
