// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_friflex/data/services/geolocation/repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc(this._geolocationRepository) : super(GeolocationInitial()) {
    on<GeolocationEvent>((event, emit) async {
      emit(GeolocationLoadingState());
      try {
        if (event is GeolocationLoadEvent) {
          _geolocationSubscription?.cancel();
          final Position position =
              await _geolocationRepository.getCurrentLocation();
          List<Placemark> placemark = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          // log(placemark.toString());
          emit(GeolocationLoadedState(
              address: placemark[0].administrativeArea.toString(),
              position: position));
        }
      } catch (e) {
        emit(GeolocationErrorState());
      }
    });
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
