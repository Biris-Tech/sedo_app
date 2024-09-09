import 'package:flutter/material.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/maps_card_component.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
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
          const MapWidget(), // Ton widget de carte
          
          // Affichage du loader si isLoad est true
          if (viewModel.isBusy) 
            Center(
              child: Container(
                height: screenHeight(context),
                width: screenWidth(context),
                color: Colors.white70,
                child: Center(
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.moveCamera,
        backgroundColor: Colors.white,
        child: Icon(Icons.my_location_outlined, color: kcPrimaryColor),
      ),
    );
  }

  @override
  ReceptionViewModel viewModelBuilder(BuildContext context) => ReceptionViewModel();
}
