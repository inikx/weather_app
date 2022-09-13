import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_friflex/bloc/weather/weather_bloc.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/presentation/widgets/app_show_dialog.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/custom_sliver_app_bar.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/forecast/forecast_list.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_detailed_info_grid.dart';
import 'package:weather_app_friflex/presentation/widgets/home_page/weather_main_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return CustomScrollView(controller: _scrollController, slivers: [
            const CustomSliverAppBar(),
            SliverToBoxAdapter(
                child: WeatherMainInfo(
                    icon: state.loadedWeather.icon,
                    temp: state.loadedWeather.temp)),
            SliverToBoxAdapter(
                child: ForecastList(forecast: state.loadedWeatherForecast)),
            SliverToBoxAdapter(
                child: WeatherDetailedInfoGrid(weather: state.loadedWeather))
          ]);
        } else if (state is WeatherLoadingState || state is WeatherInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return AppShowDialog(
            title: "Ошибка загрузки данных",
            content: "Пожалуйста, проверьте сетевое подключение.",
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, SELECT_CITY, (route) => false);
                  },
                  icon: const Icon(Icons.location_city_rounded))
            ],
          );
        }
      },
    ));
  }
}
