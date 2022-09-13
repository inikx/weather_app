// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';

class Weather {
  int temp;
  int temp_feels_like;
  int temp_min;
  int temp_max;
  int pressure;
  int humidity;
  double wind_speed;
  double wind_deg;
  double wind_gust;
  String icon;
  Weather({
    required this.temp,
    required this.temp_feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.wind_speed,
    required this.wind_deg,
    required this.wind_gust,
    required this.icon,
  });

  Weather copyWith({
    int? temp,
    int? temp_feels_like,
    int? temp_min,
    int? temp_max,
    int? pressure,
    int? humidity,
    double? wind_speed,
    double? wind_deg,
    double? wind_gust,
    String? icon,
  }) {
    return Weather(
      temp: temp ?? this.temp,
      temp_feels_like: temp_feels_like ?? this.temp_feels_like,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      wind_speed: wind_speed ?? this.wind_speed,
      wind_deg: wind_deg ?? this.wind_deg,
      wind_gust: wind_gust ?? this.wind_gust,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'temp_feels_like': temp_feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
      'wind_speed': wind_speed,
      'wind_deg': wind_deg,
      'wind_gust': wind_gust,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temp: map['temp'] as int,
      temp_feels_like: map['temp_feels_like'] as int,
      temp_min: map['temp_min'] as int,
      temp_max: map['temp_max'] as int,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      wind_speed: map['wind_speed'] as double,
      wind_deg: map['wind_deg'] as double,
      wind_gust: map['wind_gust'] as double,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    log("http://openweathermap.org/img/wn/${json['weather'][0]['icon']}");
    return Weather(
        temp: (double.tryParse(json['main']['temp'].toString()) ?? 0).round(),
        temp_feels_like:
            (double.tryParse(json['main']['feels_like'].toString()) ?? 0)
                .round(),
        temp_min:
            (double.tryParse(json['main']['temp_min'].toString()) ?? 0).round(),
        temp_max:
            (double.tryParse(json['main']['temp_max'].toString()) ?? 0).round(),
        pressure:
            (double.tryParse(json['main']['pressure'].toString()) ?? 0).round(),
        humidity:
            (double.tryParse(json['main']['humidity'].toString()) ?? 0).round(),
        wind_speed: double.tryParse(json['wind']['speed'].toString()) ?? 0,
        wind_deg: double.tryParse(json['wind']['deg'].toString()) ?? 0,
        wind_gust: double.tryParse(json['wind']['gust'].toString()) ?? 0,
        icon: "assets/icons/${json['weather'][0]['icon']}.svg");
  }
  @override
  String toString() {
    return 'Weather(temp: $temp, temp_feels_like: $temp_feels_like, temp_min: $temp_min, temp_max: $temp_max, pressure: $pressure, humidity: $humidity, wind_speed: $wind_speed, wind_deg: $wind_deg, wind_gust: $wind_gust, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.temp_feels_like == temp_feels_like &&
        other.temp_min == temp_min &&
        other.temp_max == temp_max &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.wind_speed == wind_speed &&
        other.wind_deg == wind_deg &&
        other.wind_gust == wind_gust &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        temp_feels_like.hashCode ^
        temp_min.hashCode ^
        temp_max.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        wind_speed.hashCode ^
        wind_deg.hashCode ^
        wind_gust.hashCode ^
        icon.hashCode;
  }
}
