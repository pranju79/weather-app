import 'package:geolocator/geolocator.dart';

class LocationService {
  // Retrieves the current position of the device.
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
