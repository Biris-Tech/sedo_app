import 'package:flutter/material.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
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
          const MapWidget(), // Utilisation de la carte avec StackedHookView
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.moveCamera,
        backgroundColor: Colors.white,
        child: Icon(Icons.my_location_outlined, color: kcPrimaryColor,),
      ),
    );
  }

  @override
  bool get reactive => false; // Pas de réactivité globale
  @override
  ReceptionViewModel viewModelBuilder(BuildContext context) => ReceptionViewModel();
}
