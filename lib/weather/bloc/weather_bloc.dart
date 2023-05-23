
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/data/repositories/weather_repository_impl.dart';


import '../../data/models/response/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositoryImpl weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherState()) {
    on<GetWeather>(_getWeather);
  }
  void _getWeather(GetWeather event, Emitter<WeatherState> emit) async{
    emit(state.copyWith(status: Status.loading));
    Weather weather = await weatherRepository.getWeather(event.city);
    emit(state.copyWith(status: Status.success, weather:  weather,));
  }
}
