import 'package:flutter/material.dart';
import 'package:weather_app_friflex/data/models/weather.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/forecast/forecast_card.dart';

class ForecastList extends StatelessWidget {
  final List<Weather> forecast;
  const ForecastList({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: forecast.length,
          itemBuilder: (context, index) {
            return ForecastCard(
                icon: forecast[index].icon,
                datetime: forecast[index].dt_txt,
                temp: "${forecast[index].temp}");
          }),
    );
  }
}
