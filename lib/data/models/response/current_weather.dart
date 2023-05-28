class CurrentWeather {
  double? temperature;
  double? windSpeed;
  String? time;
  int? weatherCode;

  CurrentWeather({this.temperature, this.windSpeed, this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windSpeed = json['windspeed'];
    time = json['time'];
    weatherCode = json['weathercode'];
  }
}
