import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/presentation/pages/home_page.dart';
import 'package:weather_app_friflex/presentation/pages/select_city_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SELECT_CITY:
        return CupertinoPageRoute(
          builder: (_) => const SelectCityPage(),
        );
      case HOME:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
