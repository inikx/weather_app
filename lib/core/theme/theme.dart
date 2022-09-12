import 'package:flutter/material.dart';
import 'package:weather_app_friflex/core/theme/colors.dart';

class Themes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      fontFamily: "Montserrat",
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF04566E))),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF04566E),
            fontWeight: FontWeight.w600,
            fontSize: 20),
        headline2: TextStyle(
            color: Color(0xFF04566E),
            fontWeight: FontWeight.w600,
            fontSize: 15),
        bodyText1: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
        bodyText2: TextStyle(
            color: Color(0xFF6F7789),
            fontWeight: FontWeight.w300,
            fontSize: 12),
        button: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      primaryColor: const Color(0xFF04566E),
      focusColor: const Color(0xFF04566E),
      colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xFF04566E))
          .copyWith(primary: const Color(0xFF04566E)));
}
