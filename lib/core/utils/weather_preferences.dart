import 'package:shared_preferences/shared_preferences.dart';

class WeatherPreferences {
  static SharedPreferences? _preferences;

  static Future<void> initPreferences() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setCity(String city) async {
    await _preferences!.setString("city", city);
  }

  static Future<void> setLat(double lat) async {
    await _preferences!.setDouble("lat", lat);
  }

  static Future<void> setLon(double lon) async {
    await _preferences!.setDouble("lon", lon);
  }

  static String? getCity() => _preferences?.getString("city");

  static double? getLat() => _preferences?.getDouble("lat");

  static double? getLon() => _preferences?.getDouble("lon");
}
