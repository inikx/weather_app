import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_detailed_info_card.dart';

class WeatherDetailedInfoGrid extends StatelessWidget {
  final Weather weather;
  const WeatherDetailedInfoGrid({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              WeatherDetailedInfoCard(
                icon: TEMP_FEEL_LIKE,
                title: "Ощущается как",
                value: "${weather.temp_feels_like} °",
              ),
              WeatherDetailedInfoCard(
                icon: WIND_SPEED,
                title: "Скорость ветра",
                value: "${weather.wind_speed} м/c",
              )
            ],
          ),
          Row(
            children: [
              WeatherDetailedInfoCard(
                icon: TEMP_MIN,
                title: "Мин.",
                value: "${weather.temp_min} °",
              ),
              WeatherDetailedInfoCard(
                icon: TEMP_MAX,
                title: "Макс.",
                value: "${weather.temp_max} °",
              )
            ],
          ),
          Row(
            children: [
              WeatherDetailedInfoCard(
                icon: HUMIDITY,
                title: "Влажность",
                value: "${weather.humidity} %",
              ),
              WeatherDetailedInfoCard(
                icon: PRESSURE,
                title: "Давление",
                value: "${weather.pressure} мм рт. ст.",
              )
            ],
          ),
          Row(
            children: [
              WeatherDetailedInfoCard(
                icon: WIND_DEG,
                title: "Угол ветра",
                value: "${weather.wind_deg} °",
              ),
              WeatherDetailedInfoCard(
                icon: WIND_GUST,
                title: "Порыв ветра",
                value: "${weather.wind_gust} м/c",
              )
            ],
          ),
        ],
      ),
    );
  }
}
