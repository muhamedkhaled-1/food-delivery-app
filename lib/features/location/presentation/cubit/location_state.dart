part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final double latitude;
  final double longitude;

  LocationSuccess({
    required this.latitude,
    required this.longitude,
  });
}

class LocationFailure extends LocationState {
  final String message;

  LocationFailure(this.message);
}