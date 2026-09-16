import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService locationService;

  LocationCubit(this.locationService) : super(LocationInitial());

  Future<void> accessLocation() async {
    emit(LocationLoading());

    try {
      final position =
      await locationService.getCurrentLocation();

      final locationName =
      await locationService.getLocationName(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      emit(
        LocationSuccess(
          latitude: position.latitude,
          longitude: position.longitude,
          locationName: locationName,
        ),
      );
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }}