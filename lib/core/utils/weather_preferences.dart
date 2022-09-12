import 'package:shared_preferences/shared_preferences.dart';

class WeatherPreferences {
  static SharedPreferences? _preferences;

  static Future<void> initPreferences() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setCity(String city) async {
    await _preferences!.setString("city", city);
  }

  static String? getCity() => _preferences!.getString("city");
}
