import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    // Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check permission
    LocationPermission permission = await Geolocator.checkPermission();

    // Ask for permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied.');
      }
    }

    // Permanently denied
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permission is permanently denied. '
            'Please enable it from settings.',
      );
    }

    // Get location
    return await Geolocator.getCurrentPosition();
  }
}