import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class WeatherDetailedInfoCard extends StatefulWidget {
  final String icon;
  final String title;
  final String value;
  const WeatherDetailedInfoCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  State<WeatherDetailedInfoCard> createState() =>
      _WeatherDetailedInfoCardState();
}

class _WeatherDetailedInfoCardState extends State<WeatherDetailedInfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Card(
          elevation: 2,
          //color: Color.fromARGB(255, 181, 237, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.cloud,
                  size: 50,
                ),
                Text(widget.title,
                    style: Theme.of(context).textTheme.bodyText1),
                Text(widget.value, style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
