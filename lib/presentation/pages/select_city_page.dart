import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/core/constants/locator.dart';
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
          return _getSelectCityPage(state.address);
        } else if (state is GeolocationLoadingState) {
          return const CircularProgressIndicator();
        } else {
          return _getSelectCityPage("");
        }
      }),
    ));
  }

  _getSelectCityPage(String address) {
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
                  log(_city);
                });
              },
              initialValue: address,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
                onPressed: () async {
                  _cityChanged
                      ? WeatherPreferences.setCity(_city)
                      : WeatherPreferences.setCity(address);
                  log(_city);
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
