import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather/search/search.dart';
import 'package:flutter_weather/weather/widgets/weather_empty.dart';
import 'package:flutter_weather/weather/widgets/weather_error.dart';
import 'package:flutter_weather/weather/widgets/weather_loading.dart';
import 'package:flutter_weather/weather/widgets/weather_populated.dart';

import '../bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(context.read<WeatherRepositoryImpl>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  Future<void> getRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              var result = await Navigator.of(context).push(
                SearchScreen.route(),
              );
              if (result != null && mounted) {
                context.read<WeatherBloc>().add(GetWeather(city: result));
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return const WeatherEmpty();
                case Status.failed:
                  return const WeatherError();
                case Status.loading:
                  return const WeatherLoading();
                case Status.success:
                  return WeatherPopulated(
                    weather: state.weather!,
                    units: state.temperatureUnits,
                    onRefresh: () {
                      return getRefresh();
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
