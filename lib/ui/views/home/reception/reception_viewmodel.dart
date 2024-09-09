import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:stacked/stacked.dart';

class ReceptionViewModel extends ReactiveViewModel {
  final _locationService = locator<LocationService>();
  bool isLoad = false;
  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _fetchLocation();
    setBusy(false);
    print('$isBusy');
  }

  Future<void> _fetchLocation() async {
    setBusy(true);
    await _locationService.getLocation();
    setBusy(false);
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
  List<ListenableServiceMixin> get listenableServices => [_locationService];
}
