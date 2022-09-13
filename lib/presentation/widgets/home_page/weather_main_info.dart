import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class WeatherMainInfo extends StatelessWidget {
  final String icon;
  final int temp;
  const WeatherMainInfo({super.key, required this.icon, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 200,
          ),
          const SizedBox(
            width: 20,
          ),
          Text("$temp °",
              style: const TextStyle(
                  color: appMainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 50)),
        ],
      ),
    );
  }
}
