import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_detailed_info_card.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({super.key});

  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 1,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return WeatherDetailedInfoCard();
        },
        childCount: 8,
      ),
    );
  }
}
