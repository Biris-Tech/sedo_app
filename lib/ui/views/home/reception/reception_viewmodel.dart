import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/app/app.locator.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/services/location_service.dart';
import 'package:stacked/stacked.dart';

class ReceptionViewModel extends BaseViewModel {
  final _locationService = locator<LocationService>();

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    print("locate1 $currentLocation");
    await _locationService.getLocation();
    print("locate $currentLocation");
  }
}
