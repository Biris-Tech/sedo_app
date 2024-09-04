import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/views/home/reception/reception_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CustomGoogleMap extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final CameraPosition initialCameraPosition;
  final MapType mapType;
  final Set<Marker> markers;

  const CustomGoogleMap({
    super.key,
    required this.onMapCreated,
    required this.initialCameraPosition,
    this.mapType = MapType.normal, 
    this.markers = const {},      
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: initialCameraPosition,
      mapType: mapType,
      markers: markers,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
    );
  }
}


class MapWidget extends StackedHookView<ReceptionViewModel> {
  const MapWidget({super.key});

  @override
  Widget builder(BuildContext context, ReceptionViewModel viewModel) {
    return GoogleMap(
      onMapCreated: viewModel.onMapCreated,
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 13,
      ),
      mapType: MapType.normal,
      markers: {
        Marker(
          position: currentLocation,
          markerId: const MarkerId('currentLocation'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      },
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
    );
  }

  @override
  bool get reactive => ; 
}
