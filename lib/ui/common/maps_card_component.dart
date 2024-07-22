import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final CameraPosition initialCameraPosition;
  MapType mapType;
  Set<Marker> markers = {};

  CustomGoogleMap({
    super.key,
    required this.onMapCreated,
    required this.initialCameraPosition,
    required this.mapType,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: initialCameraPosition,
      mapType: mapType,
      markers: markers,
      myLocationEnabled: true,
    );
  }
}
