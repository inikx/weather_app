import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/core/utils/locator.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  String _city = "";
  bool _cityChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<GeolocationBloc, GeolocationState>(
          builder: (context, state) {
        if (state is GeolocationLoadedState) {
          return _getSelectCityPage(
              state.address, state.position.latitude, state.position.longitude);
        } else if (state is GeolocationLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return _getSelectCityPage("", 0, 0);
        }
      }),
    ));
  }

  _getSelectCityPage(String address, double lat, double lon) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Привет, выбери город!",
                style: Theme.of(context).textTheme.headline1),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _cityChanged = true;
                  _city = value;
                });
              },
              initialValue: WeatherPreferences.getCity() != ""
                  ? WeatherPreferences.getCity()
                  : address,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
                onPressed: () async {
                  if (_cityChanged) {
                    List<Location> locations =
                        await locationFromAddress("$_city, Россия");
                    WeatherPreferences.setLat(locations[0].latitude);
                    WeatherPreferences.setLon(locations[0].longitude);
                    WeatherPreferences.setCity(_city);
                  } else {
                    WeatherPreferences.setLat(lat);
                    WeatherPreferences.setLon(lon);
                    WeatherPreferences.setCity(address);
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, HOME, (route) => false);
                },
                child: Container(
                  child: Text("Продолжить"),
                ))
          ],
        ),
      ),
    );
  }
}
