// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';
import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:weather_app_friflex/data/services/weather_api/repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherLoadEvent>((event, emit) async {
      WeatherLoadingState();
      try {
        final double? lat = WeatherPreferences.getLat();
        final double? lon = WeatherPreferences.getLon();
        final Weather loadedWeather =
            await _weatherRepository.getCurrentWeather(lat!, lon!);
        final List<Weather> loadedWeatherForecast =
            await _weatherRepository.getWeatherForecast(lat, lon);
        emit(WeatherLoadedState(
            loadedWeatherForecast: loadedWeatherForecast,
            loadedWeather: loadedWeather));
      } catch (e) {
        emit(WeatherErrorState());
      }
    });
  }
}
