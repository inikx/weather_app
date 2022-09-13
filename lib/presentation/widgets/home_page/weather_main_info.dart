import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class WeatherMainInfo extends StatefulWidget {
  final String icon;
  final int temp;
  const WeatherMainInfo({super.key, required this.icon, required this.temp});

  @override
  State<WeatherMainInfo> createState() => _WeatherMainInfoState();
}

class _WeatherMainInfoState extends State<WeatherMainInfo> {
  late String _dateFormat;
  @override
  void initState() {
    _dateFormat = DateFormat.MMMMd('ru').add_jm().format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Column(
        children: [
          Text(
            _dateFormat,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.icon,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text("${widget.temp} °",
                  style: const TextStyle(
                      color: appMainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 50)),
            ],
          ),
        ],
      ),
    );
  }
}
