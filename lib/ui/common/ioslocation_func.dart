import 'package:geolocator/geolocator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<bool> handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are disabled. Please enable the services
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Location permissions are denied
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Location permissions are permanently denied, we cannot request permissions.

    return false;
  }
  return true;
}

Future<void> getCurrentPosition() async {
  print('ios');
  try {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation = LatLng(position.latitude, position.longitude);
  } catch (e) {
    return;
  }
}
