import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class WeatherDetailedInfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  const WeatherDetailedInfoCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      icon,
                      height: MediaQuery.of(context).size.height * 0.02,
                      color: appMainColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text(title, style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(value, style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
