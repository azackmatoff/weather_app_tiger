import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/presentation/home/flutter-way/no_set_state/view/two_home_view.dart';
import 'package:weather_app/app/presentation/home/flutter-way/set_state/view/home_view.dart';
import 'package:weather_app/app/presentation/home/getx/view/getx_home_view.dart';

void main() {
  runApp(const GetxApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class MyAppWithNoSetState extends StatelessWidget {
  const MyAppWithNoSetState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TwoHomeView(),
    );
  }
}

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetxHomeView(),
    );
  }
}
