import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ForecastCard extends StatefulWidget {
  final String icon;
  final DateTime datetime;
  final String temp;
  const ForecastCard(
      {super.key,
      required this.icon,
      required this.datetime,
      required this.temp});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  late DateFormat _dateFormatMd;
  late DateFormat _dateFormatT;
  @override
  void initState() {
    _dateFormatMd = DateFormat.MMMMd('ru');
    _dateFormatT = DateFormat.jm('ru');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_dateFormatMd.format(widget.datetime),
                    style: Theme.of(context).textTheme.bodyText1),
                Text(_dateFormatT.format(widget.datetime),
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                SvgPicture.asset(
                  widget.icon,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text("${widget.temp} °",
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
