
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/data/repositories/weather_reopository.dart';
import 'package:flutter_weather/data/repositories/weather_repository_impl.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: kIsWeb
      ? HydratedStorage.webStorageDirectory
      : await getTemporaryDirectory());

  runApp(WeatherApp(weatherRepository: WeatherRepositoryImpl(),));
}