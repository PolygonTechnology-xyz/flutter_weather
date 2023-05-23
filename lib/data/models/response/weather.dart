import 'package:equatable/equatable.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  unknown,
}
enum TemperatureUnits { fahrenheit, celsius }
extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Weather  extends Equatable{
  final String location;
  final double temperature;
  final WeatherCondition condition;

   const Weather({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  @override
  List<Object?> get props => [location, temperature,condition];}