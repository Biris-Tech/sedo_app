import 'package:stacked/stacked.dart';
import 'package:location/location.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService with ListenableServiceMixin {
  Future<void> getLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    mapController.animateCamera(CameraUpdate.newLatLng(currentLocation));
  }
}

 