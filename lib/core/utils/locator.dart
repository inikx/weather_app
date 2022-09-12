import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/bloc/weather/weather_bloc.dart';
import 'package:weather_app_friflex/data/services/geolocation/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app_friflex/data/services/weather_api/network_service.dart';
import 'package:weather_app_friflex/data/services/weather_api/repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Geolocation
  getIt.registerSingleton(GeolocationRepository());
  getIt.registerSingleton(GeolocationBloc(getIt<GeolocationRepository>()));

  //Weather
  getIt.registerSingleton(WeatherNetworkService());
  getIt.registerSingleton(WeatherRepository());
  getIt.registerSingleton(WeatherBloc(getIt<WeatherRepository>()));
}
