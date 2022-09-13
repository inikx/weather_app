import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:weather_app_friflex/data/services/weather_api/network_service.dart';

class WeatherRepository {
  final WeatherNetworkService _weatherNetworkService = WeatherNetworkService();
  Future<Weather> getCurrentWeather(double lat, double lon) async =>
      _weatherNetworkService.getCurrentWeather(lat, lon);

  Future<List<Weather>> getWeatherForecast(double lat, double lon) async =>
      _weatherNetworkService.getWeatherForecast(lat, lon);
}
