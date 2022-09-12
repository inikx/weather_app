import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_friflex/bloc/weather/weather_bloc.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';

class CustomSliverAppBar extends StatefulWidget {
  final bool isShrink;
  final int temp;
  const CustomSliverAppBar(
      {super.key, required this.isShrink, required this.temp});

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      elevation: 3,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SELECT_CITY);
            },
            icon: Icon(Icons.location_city_rounded))
      ],
      title: Text(WeatherPreferences.getCity()!,
          style: Theme.of(context).textTheme.headline1),
      expandedHeight: 300.0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 2.3,
          background: Image.network(
            "https://img.freepik.com/free-vector/gorgeous-clouds-background-with-blue-sky-design_1017-25501.jpg",
            fit: BoxFit.cover,
          ),
          title: !widget.isShrink
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${widget.temp} °",
                        style: Theme.of(context).textTheme.headline1),
                  ],
                )
              : null),
    );
  }
}
