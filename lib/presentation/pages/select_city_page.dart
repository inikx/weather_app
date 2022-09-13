import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app_friflex/bloc/geolocation/geolocation_bloc.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';
import 'package:weather_app_friflex/core/constants/strings.dart';
import 'package:weather_app_friflex/core/utils/weather_preferences.dart';

class SelectCityPage extends StatefulWidget {
  const SelectCityPage({super.key});

  @override
  State<SelectCityPage> createState() => _SelectCityPageState();
}

class _SelectCityPageState extends State<SelectCityPage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController =
        TextEditingController(text: WeatherPreferences.getCity() ?? "");
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Привет, введи город России!",
              style: Theme.of(context).textTheme.headline1),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      cursorColor: appMainColor,
                      decoration: const InputDecoration().applyDefaults(
                          Theme.of(context).inputDecorationTheme))),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
                  if (state is GeolocationLoadedState) {
                    return ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _textEditingController.text = state.address;
                          });
                        },
                        child: const Text("Где я?"));
                  } else if (state is GeolocationLoadingState) {
                    return const CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  List<Location> locations = await locationFromAddress(
                      "${_textEditingController.text}, Россия");

                  WeatherPreferences.setLat(locations[0].latitude);
                  WeatherPreferences.setLon(locations[0].longitude);
                  WeatherPreferences.setCity(_textEditingController.text);

                  Navigator.pushNamedAndRemoveUntil(
                      context, HOME, (route) => false);
                } catch (e) {
                  const snackBar = SnackBar(
                    content: Text("Ошибка. Введённый город не найден."),
                    backgroundColor: Colors.red,
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(5),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text("Продолжить")),
        ],
      ),
    )));
  }
}
