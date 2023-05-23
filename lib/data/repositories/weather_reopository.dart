
import '../models/response/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String city);
}