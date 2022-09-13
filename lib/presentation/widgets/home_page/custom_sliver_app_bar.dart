import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      elevation: 3,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SELECT_CITY);
            },
            icon: const Icon(Icons.location_city_rounded))
      ],
      title: Text(WeatherPreferences.getCity()!,
          style: Theme.of(context).textTheme.headline1),
      backgroundColor: const Color(0xFFF6F6F6),
    );
  }
}
