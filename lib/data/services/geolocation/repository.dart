import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class GeolocationRepository {
  GeolocationRepository();
  late Position _currentLocation;

  Future<Position> getCurrentLocation() async {
    try {
      var isServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!isServiceEnabled) {
        isServiceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!isServiceEnabled) {
          throw Exception("The Location service is disabled!");
        }
      }

      var isPermission = await Geolocator.checkPermission();
      if (isPermission == LocationPermission.denied ||
          isPermission == LocationPermission.deniedForever) {
        isPermission = await Geolocator.requestPermission();
      }
      if (isPermission == LocationPermission.denied ||
          isPermission == LocationPermission.deniedForever) {
        throw Exception("Location Permission requests has been denied!");
      }
      if (isServiceEnabled &&
          (isPermission == LocationPermission.always ||
              isPermission == LocationPermission.whileInUse)) {
        _currentLocation = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high)
            .timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException(
              "Location information could not be obtained within the requested time.");
        });
      }
    } catch (e) {
      log(e.toString());
    }
    return _currentLocation;
  }
}
