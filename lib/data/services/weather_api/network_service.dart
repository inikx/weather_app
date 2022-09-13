import 'dart:convert';
import 'dart:io';

import 'package:weather_app_friflex/core/constants/api_keys.dart';
import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherNetworkService {
  final String apiKey = APIKeys.openWeatherAPIKey;
  Future<Weather> getCurrentWeather(double lat, double lon) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
    try {
      final response = await http.get(Uri.parse(url));
      switch (response.statusCode) {
        case 200:
          return Weather.fromJson(json.decode(response.body));
        case 401:
          throw Exception("Invalid API key");
        case 404:
          throw Exception("Weather not found");
        default:
          throw Exception("Unknown exception");
      }
    } on SocketException catch (_) {
      throw Exception("No internet connection");
    }
  }
}
