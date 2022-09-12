part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}

class GeolocationInitial extends GeolocationState {}

class GeolocationLoadingState extends GeolocationState {}

class GeolocationLoadedState extends GeolocationState {
  final Position position;
  final String address;

  const GeolocationLoadedState({required this.address, required this.position});

  @override
  List<Object> get props => [position, address];
}

class GeolocationErrorState extends GeolocationState {}
