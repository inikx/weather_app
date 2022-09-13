import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/utils/locator.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/theme/theme.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';
import 'package:weather_app_friflex/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await WeatherPreferences.initPreferences();
  runApp(WeatherApp(router: AppRouter()));
}

class WeatherApp extends StatelessWidget {
  final AppRouter router;
  const WeatherApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: Themes.lightTheme,
      onGenerateRoute: router.generateRoute,
      initialRoute: WeatherPreferences.getCity() != null ? HOME : SELECT_CITY,
    );
  }
}
