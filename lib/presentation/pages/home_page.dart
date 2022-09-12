import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_friflex/bloc/weather/weather_bloc.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/custom_sliver_app_bar.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_detailed_info_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool lastStatus = true;
  double height = 50; //
  late SharedPreferences _preferences;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController.hasClients &&
        _scrollController.offset > 180; //
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
          if (state is WeatherLoadedState) {
            return NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  CustomSliverAppBar(
                      isShrink: _isShrink, temp: state.loadedWeather.temp)
                ];
              },
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child:
                        WeatherDetailedInfoGrid(weather: state.loadedWeather))
              ]),
            );
          } else if (state is WeatherLoadingState || state is WeatherInitial) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Ошибка загрузки данных"));
          }
        });
      },
    ));
  }
}
