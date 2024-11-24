import 'package:weather/models/weather_model.dart';

abstract class WeatherState {}

class Weather_Initial extends WeatherState {}

class Weather_Loading extends WeatherState {}

class Weather_Success extends WeatherState {
  WeatherModel weatherModel;
  Weather_Success({required this.weatherModel});
}

class Weather_Error extends WeatherState {}
