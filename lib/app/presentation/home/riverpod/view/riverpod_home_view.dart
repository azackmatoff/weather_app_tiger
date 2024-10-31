import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/app/presentation/city/view/city_view.dart';
import 'package:weather_app/app/presentation/home/riverpod/new_providers/home_view_provider.dart';
import 'package:weather_app/app/presentation/home/riverpod/new_providers/home_view_provider_state.dart';
import 'package:weather_app/app/presentation/home/riverpod/providers/home_provider.dart';
import 'package:weather_app/app/presentation/home/riverpod/providers/home_provider_state.dart';
import 'package:weather_app/common/constants/app_text_style.dart';

class RiverpodHomeView extends StatefulWidget {
  const RiverpodHomeView({super.key});

  @override
  _RiverpodHomeViewState createState() => _RiverpodHomeViewState();
}

class _RiverpodHomeViewState extends State<RiverpodHomeView> {
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
            child: Consumer(
              builder: (context, ref, child) {
                final provider = ref.watch(homViewNotifierProvider);
                return provider.isLoading ? _loader() : _content(context, provider, ref);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, HomeViewProviderState provider, WidgetRef ref) {
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
                  final providerBizLogic = ref.read(homViewNotifierProvider.notifier);
                  providerBizLogic.getWeatherByCityName(city);
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
            Text(
              '${provider.weather?.main.temp.toString()} °',
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
            provider.weather?.weather.first.description ?? '',
            textAlign: TextAlign.right,
            style: AppTextStyle.messageTextStyle,
          ),
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
