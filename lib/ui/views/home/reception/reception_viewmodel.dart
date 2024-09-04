import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:stacked/stacked.dart';

class ReceptionViewModel extends ReactiveViewModel {
  final _locationService = locator<LocationService>();

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    await _locationService.getLocation();
    notifyListeners();
  }

  void moveCamera() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 15.0,
        ),
      ),
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_locationService ];
}
