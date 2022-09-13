part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather loadedWeather;
  final List<Weather> loadedWeatherForecast;

  const WeatherLoadedState(
      {required this.loadedWeather, required this.loadedWeatherForecast});
}

class WeatherErrorState extends WeatherState {}
