import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_detailed_info_card.dart';

class WeatherDetailedInfoGrid extends StatefulWidget {
  final Weather weather;
  const WeatherDetailedInfoGrid({super.key, required this.weather});

  @override
  State<WeatherDetailedInfoGrid> createState() =>
      _WeatherDetailedInfoGridState();
}

class _WeatherDetailedInfoGridState extends State<WeatherDetailedInfoGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            WeatherDetailedInfoCard(
              icon: "",
              title: "Ощущается как",
              value: "${widget.weather.temp_feels_like} °",
            ),
            WeatherDetailedInfoCard(
              icon: "",
              title: "Скорость ветра",
              value: "${widget.weather.wind_speed} м/c",
            )
          ],
        ),
        Row(
          children: [
            WeatherDetailedInfoCard(
              icon: "",
              title: "Мин.",
              value: "${widget.weather.temp_min} °",
            ),
            WeatherDetailedInfoCard(
              icon: "",
              title: "Макс.",
              value: "${widget.weather.temp_max} °",
            )
          ],
        ),
        Row(
          children: [
            WeatherDetailedInfoCard(
              icon: "",
              title: "Влажность",
              value: "${widget.weather.humidity} %",
            ),
            WeatherDetailedInfoCard(
              icon: "",
              title: "Давление",
              value: "${widget.weather.pressure} мм рт. ст.",
            )
          ],
        ),
        Row(
          children: [
            WeatherDetailedInfoCard(
              icon: "",
              title: "Угол ветра",
              value: "${widget.weather.wind_deg} °",
            ),
            WeatherDetailedInfoCard(
              icon: "",
              title: "Порыв ветра",
              value: "${widget.weather.wind_gust} м/c",
            )
          ],
        ),
      ],
    );
    // return SliverGrid(
    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200.0,
    //     childAspectRatio: 1,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return
    //           WeatherDetailedInfoCard(icon: "",),

    //     },
    //   ),
    // );
  }
}
