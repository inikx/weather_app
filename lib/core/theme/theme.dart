import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class Themes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      fontFamily: "Montserrat",
      appBarTheme: const AppBarTheme(
          elevation: 10,
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: appMainColor)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: appMainColor, fontWeight: FontWeight.w600, fontSize: 20),
        headline2: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        bodyText1: TextStyle(
            color: appMainColor, fontWeight: FontWeight.w400, fontSize: 17),
        bodyText2: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15),
        button: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      primaryColor: appMainColor,
      focusColor: appMainColor,
      colorScheme: ColorScheme.fromSwatch(accentColor: appMainColor)
          .copyWith(primary: appMainColor));
}
