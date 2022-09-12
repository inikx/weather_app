import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/core/constants/locator.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/data/services/geolocation/repository.dart';
import 'package:weather_app_friflex/presentation/pages/home_page.dart';
import 'package:weather_app_friflex/presentation/pages/select_city_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SELECT_CITY:
        if (getIt.isRegistered<GeolocationBloc>()) {
          getIt.unregister<GeolocationBloc>();
        }
        getIt
            .registerSingleton(GeolocationBloc(getIt<GeolocationRepository>()));
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<GeolocationBloc>()..add(GeolocationLoadEvent()),
            child: const SelectCityPage(),
          ),
        );
      case HOME:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
