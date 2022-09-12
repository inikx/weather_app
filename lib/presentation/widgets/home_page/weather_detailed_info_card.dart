import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class WeatherDetailedInfoCard extends StatefulWidget {
  const WeatherDetailedInfoCard({super.key});

  @override
  State<WeatherDetailedInfoCard> createState() =>
      _WeatherDetailedInfoCardState();
}

class _WeatherDetailedInfoCardState extends State<WeatherDetailedInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Card(
        elevation: 2,
        //color: Color.fromARGB(255, 181, 237, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.cloud,
                size: 50,
              ),
              Text("Давление", style: Theme.of(context).textTheme.bodyText1),
              Text("1000", style: Theme.of(context).textTheme.bodyText2)
            ],
          ),
        ),
      ),
    );
  }
}
