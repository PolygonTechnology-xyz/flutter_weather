
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather/weather/screens/screen_weather.dart';


class WeatherApp extends StatelessWidget {
  final WeatherRepositoryImpl _weatherRepository;
  const WeatherApp({required WeatherRepositoryImpl weatherRepository, super.key}): _weatherRepository = weatherRepository;

  @override
  Widget build(BuildContext context) {
    return
      // WeatherAppView();
      RepositoryProvider.value(
      value: _weatherRepository,
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Colors.blue,

      ),
      home: const WeatherScreen(),
    );
  }
}
