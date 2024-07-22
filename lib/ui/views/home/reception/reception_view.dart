import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/maps_card_component.dart';
import 'package:stacked/stacked.dart';

import 'reception_viewmodel.dart';

class ReceptionView extends StackedView<ReceptionViewModel> {
  const ReceptionView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ReceptionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomGoogleMap(
                onMapCreated: viewModel.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: currentLocation,
                  zoom: 13,
                ),
                mapType: MapType.satellite,
                markers: {
                  const Marker(
                      markerId: MarkerId('currentLocation'),
                      icon: BitmapDescriptor.defaultMarker)
                })
          ],
        ));
  }

  @override
  ReceptionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReceptionViewModel();
}
