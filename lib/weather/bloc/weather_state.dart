part of 'weather_bloc.dart';

enum Status { loading, success, failed, initial }

class WeatherState extends Equatable {
  final Status status;
  final Weather? weather;
  final TemperatureUnits temperatureUnits;

  const WeatherState(
      {this.status = Status.initial,
      this.weather,
      this.temperatureUnits = TemperatureUnits.celsius});

  WeatherState copyWith(
      {Status? status, Weather? weather, TemperatureUnits? temperatureUnits}) {
    return WeatherState(
        status: status ?? this.status,
        weather: weather ?? this.weather,
        temperatureUnits: temperatureUnits ?? this.temperatureUnits);
  }

  @override
  List<Object?> get props => [status, weather, temperatureUnits];
}
