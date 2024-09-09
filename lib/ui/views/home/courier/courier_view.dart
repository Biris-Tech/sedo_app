import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sedo_app/models/constants.dart';
import 'package:sedo_app/ui/common/app_colors.dart';
import 'package:sedo_app/ui/common/text_components.dart';
import 'package:sedo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import '../../../common/button_component.dart';
import 'courier_viewmodel.dart';
import 'courier_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'recoverynum'),
  FormTextField(name: 'destinationnum'),
])
class CourierView extends StackedView<CourierViewModel> with $CourierView {
  const CourierView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CourierViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: viewModel.onMapCreated,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 13,
              ),
              mapType: MapType.normal,
              // onTap: viewModel.onMapTap,
              markers: viewModel.markers,
              polylines: viewModel.polylines,
            ),
            if (viewModel.isContainerVisible == true)
              Positioned(
                bottom: 0,
                child: Container(
                  height: 400,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            FaIcon(
                              Icons.location_on_sharp,
                              color: Color(0xFF00D860),
                            ),
                            SizedBox(width: 3),
                            TextComponent(
                              "Adresse de récupération",
                              fontweight: FontWeight.w700,
                              fontsize: 18,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            TextComponent(
                              "Lieu",
                              fontweight: FontWeight.w500,
                              fontsize: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {
                            viewModel.getRecoveryService(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 40,
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border:
                                    Border.all(color: const Color(0xFFB7B7B7))),
                            child: TextComponent(viewModel.recoveryName),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            TextComponent(
                              "Personne a contacter au point de depart",
                              fontweight: FontWeight.w500,
                              fontsize: 14,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 60,
                            child: IntlPhoneField(
                              controller: recoverynumController,
                              onChanged: (value) => viewModel.checkNumber,
                              decoration: InputDecoration(
                                labelText: '90100100',
                                contentPadding: const EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFB7B7B7)),
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                              style: const TextStyle(fontSize: 14),
                              initialCountryCode: 'BJ',
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            TextComponent(
                              "Le livreur pourra vous contacter avec ce numéro.",
                              fontweight: FontWeight.w500,
                              fontsize: 10,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              ButtonNextComponent(
                                  height: 48,
                                  width: 100,
                                  "suivant",
                                  isfull: viewModel.allInputFull,
                                  onPressed: () {
                                // viewModel.isDone = true;
                                viewModel.stateUpdate();
                                // print(" isDone: ${viewModel.isDone}");
                                recoveryPhone = recoverynumController.text;
                                print("recoveryPhone: $recoveryPhone");
                                !onTapMap
                                    ? viewModel.goToDestinationService(context)
                                    : viewModel
                                        .goToDestinationAdressInfo(context);
                              }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (viewModel.isBusy) 
               Container(
      height: screenHeight(context),
      width: screenWidth(context),
      color: Colors.white70,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kcPrimaryColor),
        ),
      ),
               )
          ],
        ));
  }

  @override
  CourierViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourierViewModel();
}
