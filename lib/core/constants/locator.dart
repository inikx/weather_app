import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/data/services/geolocation/repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  //Geolocation
  getIt.registerSingleton(GeolocationRepository());
  getIt.registerSingleton(GeolocationBloc(getIt<GeolocationRepository>()));
}
